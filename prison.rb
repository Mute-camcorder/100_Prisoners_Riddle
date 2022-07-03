class Prison
    @@population_size = 100

    def initialize
        # Each index of the array represents a box. The value at that index is the ID of a prisoner
        @randomised_boxes = (1..@@population_size).to_a.shuffle
        @prisoners = (1..@@population_size).map { |x| Prisoner.new x }
    end

    def challenge_succeeded?(search_method)
        for prisoner in @prisoners do
            result = prisoner.send(search_method, @randomised_boxes)
            if result == false
                # If one fails, they all fail
                return false
            end
        end

        # Base case for when they all passed
        return true
    end

    attr_accessor :prisoners
    attr_accessor :randomised_boxes
end