class Prisoner
    def initialize(number)
        @number = number
    end

    def found_in_random_search?(room_of_boxes)
        # Randomly pick half the box values in the room to compare against
        found_values = room_of_boxes.sample(room_of_boxes.length / 2)
        found_values.include? @number
    end

    def found_in_cycle?(room_of_boxes)
        # First, the prisoner visits the box with their own number on it
        # (guaranteeing they are in a loop containing their number)
        i = @number
        (room_of_boxes.length / 2).times {
            # Visit the box `i`, and make the value inside our next box to visit
            i = room_of_boxes[i-1]
            if i == @number
                # Base case, we have found our number inside a box!
                return true
            end
        }
        # The cycle containing our number is longer than half the boxes, thus we failed
        return false
    end
end
