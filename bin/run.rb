require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'
require 'pry'



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



# binding.pry
    


def concert_menu
    concerts.name
    puts "Please choose one of the concerts."
    chosen_concert = gets.chomp
    if chosen_concert.to_i >= 1 && chosen_concert.to_i <= concerts.length
       puts "1. Tickets and Pricing, 2. Artists Performing, 3. Venue" 
    user_response = gets.chomp
    case user_response
        when '1'
            puts Concert.all[(chosen_concert.to_i) - 1]
        when '2'
            x = Concert.all[(chosen_concert.to_i) - 1].artists.map do |artist|
                artist.name
            end
            puts x
        when '3'
            puts Concert.all.venue[(chosen_concert.to_i) - 1]
        else
            puts "Invalid Entry"
        end
    end
end

def artist_menu
    puts "Provided below are artists performing in the DC area in the next 12 months"
    artists.name
    chosen_artist = gets.chomp
    if chosen_artist == 'Drake' || chosen_artist == 'Michael Jackson' || chosen_artist == 'Adele' || chosen_artist == 'Beyonce' || chosen_artist == 'Future'
       puts "1. Concerts, 2. Venues"
    else
        puts 'Artist not available'
    end  
    user_response = gets.chomp
    case user_response
        when '1'
            
        when '2'
            x = Concert.all[(chosen_concert.to_i) - 1].artists.map do |artist|
                artist.name
            end
            puts x
        else
            puts "Invalid Entry"
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
            artist_menu
        when '3'
            venue_menu
        when '4'
            puts 'exit'
            break
        else 
            puts "Invalid entry"
        end
    end
end

welcome
