class Cli 

    def appstart
        puts "Welcome to Tee Time App"
        puts "For list of commands type 'help'."
        user_input = gets.chomp
        while user_input != 'exit'
            if user_input == 'help'
                help
            elsif user_input == 'make reservation'
                make_reservation(get_golfer_info)
            end
            user_input=gets.chomp
        end
        puts "Thanks for using the Tee Time App :)"
    end

    def help
        puts "/******************* Tee Time Commands **********************/"
        puts "/'help' -Displays list of commands                           /"
        puts "/'make reservation' -Allows user to make Tee Time reservation/"
        puts "/'find reservation' -Finds a reservation by name             /"
        puts "/'find course' -Displays list of available courses           /"
        puts "/'change party' -Allows user to change their party size      /"
        puts "/'exit' -Quits the program                                   /"
    end

    def get_golfer_info
        puts "Please enter reservation name:"
        name = gets.chomp.downcase

        puts "Please enter your age"
        age = Integer(gets) rescue false
        if age == false
            puts "Please enter a valid number"
            age = Integer(gets) rescue false
        end

        puts "Please enter your handicap"
        handicap = Integer(gets) rescue false
        if handicap == false
            puts "Please enter a valid number"
            handicap = Integer(gets) rescue false
        end

        golfer_info = [name, age, handicap]
    end

    def get_reservation_time
        puts "Please enter the time and date of your reservation"
        puts "Format: (ex: 7:00AM 01/01/2020)"
        reservation = gets.chomp
    end

    def get_course
        puts "Enter course name:"
        course_name = gets.chomp
        course = Course.find_by(name: course_name)

        if course == nil
            puts "Course not found. Please enter a valid course name:"
            course_name = gets.chomp
            course = Course.find_by(name: course_name)
        else
            return course
        end
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

    def create_new_golfer(name, age, handicap)
        Golfer.create(name: name, age: age, handicap: handicap)
    end

    def create_new_teetime(reservation_time, course, golfer, party_size)
        Teetime.create(reservation_time: reservation_time, course: course, golfer: golfer, party_size: party_size)
    end


    def make_reservation(golfer_info)
        golfer = create_new_golfer(golfer_info[0], golfer_info[1], golfer_info[2])
        create_new_teetime(get_reservation_time, get_course, golfer, get_party_size)
        puts "Your reservation has been made."
    end

end