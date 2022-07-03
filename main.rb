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
require './prison.rb'

class Simulation

    @@simulation_length = 1_000_000

    def initialize
        @prisons = (1..@@simulation_length).map { Prison.new }
        puts "Generated [#{@@simulation_length}] Prisons."
    end

    def simulate(search_method)
        results = @prisons.map { |p| p.challenge_succeeded?(search_method) }
        passed = results.count(true)
        pass_rate = passed.fdiv(results.length) * 100
        puts "#{passed} prisons succeeded out of #{results.length}. For a pass rate of #{pass_rate.round(2)}%"
    end

    def simulate_random_search
        puts "Beginning random search challenge"
        self.simulate :found_in_random_search?
    end

    def simulate_cycle_search
        puts "Beginning cycle search challenge"
        self.simulate :found_in_cycle?
    end

end


simulation = Simulation.new
simulation.simulate_random_search
simulation.simulate_cycle_search