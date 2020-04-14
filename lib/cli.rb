class Cli 

    def appstart
        puts "Welcome to Tee Time App"
        name = get_reservation_name
        party_size = get_party_size
        create_new_golfer(name, party_size)
    end

    def get_reservation_name
        puts "Please enter reservation name:"
        name = gets.chomp.downcase
    end

    def get_party_size
        puts "Please enter number of golfers in your party:"
        party_size = Integer(gets) rescue false

        if party_size == false
            puts "Error: Party size must be a number 1-4. Please enter a valid size."
            get_party_size   
        elsif party_size > 4
            puts "Party size cannot exceed 4. Please enter a valid size."
            get_party_size
        else
            return party_size
        end
    end

    def create_new_golfer(name, party_size)
        Golfer.create(name: name, party_size: party_size)
    end

end