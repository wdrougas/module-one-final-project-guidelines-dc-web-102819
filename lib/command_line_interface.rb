
require 'pry'


def welcome
    puts "Welcome to DC Concerts! Your source for shows, artists, and venues in the DC area!"
end

def invalid_command
    puts "Please enter a valid command"
end


    #if user_input equals one of the values in vald_inputs, return all of their relevant information
    #For artists, it is name, concerts and the venues of the concerts
        #For each concert the artist is performing at, you can get the name and price of tickets
            #Need to add quantity of tickets available
        #For each venue of the concert, you can get the name, street address and zip
    #For concerts, it is the venue and the artists performing
        #You can get the name and price of tickets
            #Need to add quantity of tickets available
        #For each artist, you can get their name
        #For each venue, you can get the name, street address and zip
    #For venues, it is concerts taking place at venue and artists performing at those concerts
        #You can get the name, street address and zip
        #For each concert you can get the name, price, and quantity of tickets
        #For each artist, you can get their name
