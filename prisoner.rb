class Prisoner
    def initialize(number)
        @number = number
    end

    def found_in_random_search?(room_of_boxes)
        # Randomly pick half the boxes in the room to search
        randomly_chosen_indexes = (0...room_of_boxes.length).to_a.sample(room_of_boxes.length / 2)
        # Open the boxes and see if this prisoner's number was uncovered
        found_values = randomly_chosen_indexes.map { |x| room_of_boxes[x] }
        found_values.include? @number
    end

    def found_in_cycle?(room_of_boxes)
        i = @number
        (room_of_boxes.length / 2).times { 
            i = room_of_boxes[i-1]
            if i == @number
                return true
            end
        }
        return false
    end
end
