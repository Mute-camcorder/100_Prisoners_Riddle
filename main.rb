#!/usr/bin/env ruby

require './prisoner.rb'
require './prison.rb'

class Simulation

    @@simulation_length = 1_000_000

    def simulate(search_method)
        results = (1..@@simulation_length).map do
            prison = Prison.new
            prison.challenge_succeeded?(search_method)
        end
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