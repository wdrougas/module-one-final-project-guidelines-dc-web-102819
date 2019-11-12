require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'
require 'pry'

artist_valid_inputs = ['Drake', 'Michael Jackson', 'Beyonce', 'Adele', 'Future'] 
venue_valid_inputs = ['Concert Hall', 'Boogie Hall', 'Warner Theatre', 'Echostage', 'U Street Music Hall']
concert_valid_inputs = ['Holiday Bash 2019', 'Summer Jam 2020', 'Adele 2020 Tour', 'SpringFest 2020', 'FallFest 2020']

def welcome
 puts "Welcome to DC Concerts! Your source for shows, artists, and venues in the DC area!" #entry point
 main_menu
end

def concerts
 Concert.all.each_with_index do |concert, index|
    puts "#{index+1}. #{concert.name}"
 end 
end


def artists
    Artist.all.each_with_index {|artist, index|
    puts "#{index+1}. #{artist.name}"}
end

def venues
    Venue.all.each_with_index {|venue, index|
    puts "#{index+1}. #{venue.name}"}
end


def exit_app   
 puts "Thank you for using DC Concerts!"
end

#Concert instance
def get_concert(name)
    x = Concert.find_by(name: name)
    binding.pry
end


def get_concert_venue(n)
    x = Concert.find_by(name: n)
    puts x.venue.name
end

def get_concert_artist(n)
    x = Concert.find_by(name: n)
    x.artists.map do |artist|
        artist.name
    end
end

# binding.pry
    


def concert_menu
    concerts.name
    puts "Please choose one of the concerts."
    chosen_concert = gets.chomp
case chosen_concert

    when '1' # first concert
       puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue" 
       user_response = gets.chomp
    case user_response
        when '1'
            puts get_concert("Holiday Bash 2019")
        when '2'
            puts get_concert_artist("Holiday Bash 2019")
        when '3'
            puts get_concert_venue("Holiday Bash 2019")
        else
            puts "Invalid Entry"
        end
    # when '2'
    #    puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue"
    #    user_response = gets.chomp
    # case user_response
    #     when '1'
    #         puts get_concert("Summer Jam 2020")
    #     when '2'
    #         puts get_concert_artist("Summer Jam 2020")
    #     when '3'
    #         puts get_concert_venue("Summer Jam 2020")
    #     else
    #         puts "Invalid Entry"
    #     end
    # when '3'
    #    puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue"
    #    user_response = gets.chomp
    # case user_response
    #     when '1'
    #         puts get_concert("Adele 2020 Tour")
    #     when '2'
    #         puts get_concert_artist("Adele 2020 Tour")
    #     when '3'
    #         puts get_concert_venue("Adele 2020 Tour")
    #     else
    #         puts "Invalid Entry"
    #     end
    # when '4'
    #    puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue"
    #    user_response = gets.chomp
    # case user_response
    #     when '1'
    #         puts get_concert("SpringFest 2020")
    #     when '2'
    #         puts get_concert_artist("SpringFest 2020")
    #     when '3'
    #         puts get_concert_venue("SpringFest 2020")
    #     else
    #         puts "Invalid Entry"
    #     end
    # when '5'
    #    puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue"
    #    user_response = gets.chomp
    # case user_response
    #     when '1'
    #         puts get_concert("FallFest 2020")
    #     when '2'
    #         puts get_concert_artist("FallFest 2020")
    #     when '3'
    #         puts get_concert_venue("FallFest 2020")
        else
            puts "Invalid Entry"
        end
    end
end


def main_menu
    while true do
        puts "Please choose one of the following:"
        puts "1. Concerts, 2. Artists, 3. Venues, 4. Exit"
        response = gets.chomp
        case response
        when '1'
            concert_menu
        when '2'
            #navigate to artists submenu
            artists.name
                puts "Please choose one of the artists."
            artists_response = gets.chomp
            case artists_response
                when '1'
                    puts "awefewf"
            end
        when '3'
            #navigate to venues submenu
            venues.name
                "Please choose one of the venues."
            venues_response = gets.chomp
            case venues_response
            when '1'
                puts "afwee"
            end
        when '4'
            puts 'exit'
            break
        else 
            puts "Invalid entry"
        end
    end
end

welcome
