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
 Concert.all.each_with_index {|concert, index|
 puts "#{index+1}. #{concert.name}"}
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

def main_menu
    while true do
        puts "Please choose one of the following:"
        puts "1. Concerts, 2. Artists, 3. Venues, 4. Exit"
        response = gets.chomp
        case response
        when '1'
            #navigate to concerts submenu
            concerts.name
                puts "Please choose one of the concerts."
            concerts_response = gets.chomp
            case concerts_response
                when '1'
                    
            end
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
