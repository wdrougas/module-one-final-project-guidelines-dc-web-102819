require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'
require 'pry'
require 'tty-prompt'
prompt = TTY::Prompt.new



def welcome
puts '
I CAN’T LIVE WITHOUT
╔══════╦═╗╔═╦═══╦═╦═══╗
║░╔╗╔╗░║░║║░║╚══╣░║░╔═╝
║░║╚╝║░║░╚╝░╠══╗║░║░╚═╗
╚═╝░░╚═╩════╩═══╩═╩═══╝
¸.•*¨*•♫♪¸.•*¨*•♫♪¸.•*¨*•♫♪¸.•*¨*•♫♪'
 puts ''
 puts "Welcome to DC Concerts! Your source for shows, artists, and venues in the DC area!" #entry point
 puts ''
 main_menu
end


def Concert.most_expensive_concert
    pricey_concert = Concert.all.max_by do |concert|
        concert.price
    end
    pricey_concert.name
end

def Artist.most_concerts
    artist_concerts = self.all.max_by do |artist|
        artist.artist_number_of_concerts
    end
    artist_concerts.name
end

def Venue.most_concerts
    venue_concerts = self.all.max_by do |venue|
        venue.venue_number_of_concerts
    end
    venue_concerts.name
end

def Concert.start_dates
    start_date = Concert.all.map do |x|
     {"Concert" => x.name,
        "Date" => x.date}
    end
    start_date.each do |start_date|
        start_date.each do |key, value|
            puts "#{key} - #{value}"
        end
        puts ''
    end
    nil
 end

# binding.pry

def statistics_menu
    puts ''
    puts ''
    puts ''
    puts "Please choose one of the statistics"
    puts ''
    puts ''
    puts ''
    puts "1. Most Expensive Concert 2. Artist with most concerts 3. Venue with most concerts 4. Concert Dates"
    puts ''
    puts ''
    while true do
        user_response = gets.chomp
            if user_response.to_i >= 1 && user_response.to_i <= 4
            case user_response
            when '1'
                puts ''
                puts ''
                puts ''
                puts Concert.most_expensive_concert
                puts ''
                puts ''
                puts ''
            when '2'
                puts ''
                puts ''
                puts ''
                puts Artist.most_concerts
                puts ''
                puts ''
                puts ''
            when '3'
                puts ''
                puts ''
                puts ''
                puts Venue.most_concerts
                puts ''
                puts ''
                puts ''
            when '4'
                puts ''
                puts Concert.start_dates
                puts ''
            else
                puts "Invalid Entry"
            end
            puts "Press 1 to return to main menu"
            puts ''
            user_response = gets.chomp
            case user_response
            when '1'
                puts ''
                puts ''
                puts ''
               main_menu
            end
            puts ''
        end
    end
    end

def find_artist
    Artist.all.find do |artist|
        artist.name == self
    end
end


def artists
    Artist.all.each_with_index {|artist, index|
    puts "#{index+1}. #{artist.name}"}
end

def concerts
    Concert.all.each_with_index do |concert, index|
        puts "#{index+1}. #{concert.name}"
    end
end

def venues
    Venue.all.each_with_index {|venue, index|
    puts "#{index+1}. #{venue.name}"}
end

def exit_app   
 puts "Thank you for using DC concerts!"
end

def prompt
    prompt = TTY::Prompt.new
end

def main_menu
   while true do
       prompt
       response = prompt.select('Please select one of the following: ') do |menu|
           menu.default 1
           menu.choice 'Concerts', 1
           menu.choice 'Artists', 2
           menu.choice 'Venues', 3
           menu.choice 'Statistics', 4
           menu.choice 'Exit', 5
       end
        case response
        when 1
            concert_menu
        when 2
            artist_menu
        when 3
            venue_menu
        when 4
            statistics_menu
        when 5
            exit_app
            break
        else 
            puts "Invalid entry"
        end
    end
end

def concert_menu
    puts ''
    concerts
    puts ''
    puts "Please choose one of the concerts."
    puts ''
    while true do
    chosen_concert = gets.chomp
    # binding.pry
    if chosen_concert.to_i >= 1 && chosen_concert.to_i <= Concert.all.length
       puts ''
       puts ''
       puts ''
       puts ''
       puts "1. Date, Tickets, and Pricing 2. Artists Performing 3. Venue" 
       puts ''
       puts ''
       puts ''
       puts ''
       puts ''
    user_response = gets.chomp
    case user_response
        when '1'
            puts ''
            puts ''
            puts ''
            x = Concert.all[(chosen_concert.to_i) - 1].name
            concert_instance = Concert.find_by name: x
            puts "Date - #{concert_instance.date}"
            puts "Ticket Quantity - #{concert_instance.ticket_quantity}"
            puts "Ticket Price - #{concert_instance.price}"
            puts ''
        when '2'
            puts ''
            puts ''
            puts ''
            artists_performing = Concert.all[(chosen_concert.to_i) - 1].artists.map do |artist|
                artist.name
            end
            puts artists_performing
        when '3'
            puts ''
            puts ''
            puts ''
            concert_venue = Concert.all[(chosen_concert.to_i) - 1].venue
            puts "Name - #{concert_venue.name}"
            puts "Street Address - #{concert_venue.street_address}"
            puts "Zip Code - #{concert_venue.zip}"
        else
            puts "Invalid Entry"
        end
        puts ''
        puts ''
        puts "Press 1 to return to main menu"
        puts ''
        user_response = gets.chomp
        case user_response
        when '1'
            puts ''
            puts ''
            puts ''
           main_menu
        end
        puts ''
    end
end
end

def artist_menu
    puts ''
    puts "Provided below are artists performing in the DC area in the next 12 months"
    puts ''
    artists
    puts ''
    puts "Please select one of the following:"
    while true do
        puts ""
        chosen_artist = gets.chomp
        if chosen_artist.to_i >= 1 && chosen_artist.to_i <= Artist.all.length
        puts ''
        puts ''
        puts ''
        puts "1. Concerts, 2. Venues"
        puts ''
        puts ''
        puts ''
            user_response = gets.chomp
            puts ""
            case user_response
            when '1'
                puts ''
                artist_concerts = Artist.all[(chosen_artist.to_i) - 1].concerts
                x = artist_concerts.map do |artist_concert|
                    {"Concert Name" => artist_concert.name,
                     "Date" => artist_concert.date,
                    "Ticket Quantity" => artist_concert.ticket_quantity,
                    "Ticket Price" => artist_concert.price}
                end
                x.each do |x|
                    x.each do |key,value|
                    puts "#{key} - #{value}"
                    end
                    puts ""
                end
            when '2'
                puts ''                         
                artist_venue = Artist.all[(chosen_artist.to_i) - 1].venues
                x = artist_venue.map do |artist_venue|
                    {"Venue Name"=> artist_venue.name,
                    "Venue Street Address"=>artist_venue.street_address,
                    "Venue Zip Code" => artist_venue.zip}
                end
                # x here is an array of hashes
                x.each do |x|
                    x.each do |key, value|
                        puts "#{key} - #{value}"
                    end
                    puts ''
                end
            else
                puts "Invalid Entry"
            end
        puts ''
        puts ''
        puts "Press 1 to return to main menu"
        puts ''
        user_response = gets.chomp
        case user_response
        when '1'
            puts ''
            puts ''
            puts ''
           main_menu
        end
        puts ''
    end
end
end


def venue_menu
    puts ''
    puts "Provided below are venues in the DC area."
    puts ''
    venues
    puts ''
    puts "Please select one of the following:"
    while true do
        puts ""
        chosen_venue = gets.chomp
        if chosen_venue.to_i >= 1 && chosen_venue.to_i <= Venue.all.length
           puts ''
           puts ''
           puts ''
           puts "1. Location, 2. Artists Performing, 3. Concerts" 
           puts ''
           puts ''
           puts ''
           puts ''
        end
        user_response = gets.chomp
        case user_response
        when '1'
            puts ''
            puts ''
            puts ''
            puts "Street Address - #{Venue.all[(chosen_venue.to_i) - 1].street_address}"
            puts "Zip Code - #{Venue.all[(chosen_venue.to_i) - 1].zip}"
            puts ''
            puts ''
            puts ''
            puts ''
        when '2'
            puts ''
            venue_artists = Venue.all[(chosen_venue.to_i) - 1].artists
            artists_name = venue_artists.map do |venue_artist|
                    venue_artist.name
                end
                puts artists_name
        when '3'
            puts ''
            venue_concerts = Venue.all[(chosen_venue.to_i) - 1].concerts
            x = venue_concerts.map do |venue_concert|
                {"Concert" => venue_concert.name,
                "Ticket Quantity" => venue_concert.ticket_quantity,
                "Ticket Price" => venue_concert.price,
                "Date" => venue_concert.date}
            end
            x.each do |x|
                x.each do |key, value|
                   puts "#{key} - #{value}"
                end
            end
        else
            puts "Invalid Entry"
        end
    puts ''
    puts ''
    puts "Press 1 to return to main menu"
    puts ''
    user_response = gets.chomp
    case user_response
    when '1'
        puts ''
        puts ''
        puts ''
       main_menu
    end
    puts ''
end
end



welcome
