#!/usr/bin/env ruby

# 100 prisoners are given an opportunity to escape if they can solve the following challenge.
# 
# Each prisoner is given a number from 1 to 100. The Warden will place 100 boxes in a room, 
# and randomly distribute each prisoners number into the boxes.
# One by one, the prisoners will enter the room, and have the opportunity to open half the boxes
# searching for their own number.
# The prisoners must leave the room as they found it, and may not communicate during the challenge.
# If _all_ prisoners find their number, then all prisoners are set free, but if even one prisoner
# fails to find their number then all prisoners are executed.

require './prisoner.rb'


class Prison
    def initialize
        # Each index of the array represents a box. The value at that index is the ID of a prisoner
        @randomised_boxes = (1..100).to_a.shuffle
        @prisoners = (1..100).map { |x| Prisoner.new x }
    end

    def challenge_succeeded?(search_method)
        prisoner_results = @prisoners.map { |p| p.send(test_method, @randomised_boxes) }
        prisoner_results.all?
    end

    attr_accessor :prisoners
    attr_accessor :randomised_boxes
end