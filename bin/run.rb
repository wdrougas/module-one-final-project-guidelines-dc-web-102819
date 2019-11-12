require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'

def welcome
    puts "Welcome to DC Concerts! Your source for shows, artists, and venues in the DC area!"
end

def invalid_command
    puts "Please enter a valid command"
end

def get_info_from_user
    valid_inputs = ['Drake', 'Michael Jackson', 'Beyonce', 'Adele', 'Future', 'Concert Hall', 'Boogie Hall', 'Warner Theatre', 'Echostage', 'U Street Music Hall', 'Holiday Bash 2019', 'Summer Jam 2020', 'Adele 2020 Tour', 'SpringFest 2020', 'FallFest 2020']

    welcome
    puts "please enter a show, artist, or venue name"
    user_input = gets.chomp
    

    until valid_inputs.include?(user_input)
        invalid_command
        user_input = gets.chomp
    end

    valid_inputs.select do |valid_input|
        if valid_input == user_input
            user_input.concert
        end
    end
end

welcome
get_info_from_user