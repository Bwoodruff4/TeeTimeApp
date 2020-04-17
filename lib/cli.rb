class Cli 

    def appstart
        puts "\nWelcome to Tee Time App".cyan
        puts "\nFor list of commands type 'help'.\n".yellow
        user_input = gets.chomp
        while user_input != 'exit'
            if user_input == 'help'
                help
            elsif user_input == 'make reservation'
                make_reservation
            elsif user_input == 'find reservations'
                find_reservations
            elsif user_input == 'cancel reservation'
                cancel_reservation
            elsif user_input == 'change party'
                change_party
            elsif user_input == 'find courses'
                find_courses
                puts "\nTo reserve a tee time type 'make reservation' otherwise type 'help'.".yellow
            elsif user_input == 'course weather'
                course_weather
            elsif user_input == 'change handicap'
                change_handicap
            else
                puts "Not a valid command. Please try again.".red
            end
            puts "\n**********Main Menu***********\n".cyan
            user_input=gets.chomp
        end
        puts "\nThanks for using the Tee Time App :)".green
    end

    def help
        puts "\n/********************** Tee Time Commands ***********************/".green
        puts "/'help' -Displays list of commands                               /".green
        puts "/'make reservation' -Allows user to make Tee Time reservation    /".green
        puts "/'cancel reservation' -Allows user to cancel Tee Time reservation/".green
        puts "/'find reservations' -Finds golfer's reservations                /".green
        puts "/'change party' -Allows user to change their party size          /".green
        puts "/'change handicap' -Allows user to change their handicap         /".green
        puts "/'find courses' -Displays list of available courses              /".green
        puts "/'course weather' -Displays course weather given a course name   /".green
        puts "/'exit'-Quits the program                                        /".green
    end

    def get_golfer_name
        puts "\nPlease enter your name:".yellow
        name = gets.chomp
    end

    def get_golfer_age
        puts "\nPlease enter your age".yellow
        age = Integer(gets) rescue false
        if age == false
            puts "\nPlease enter a valid number".red
            get_golfer_age
        else
            return age
        end
    end

    def get_golfer_handicap
        puts "\nPlease enter your handicap".yellow
        handicap = Integer(gets) rescue false
        if handicap == false
            puts "\nPlease enter a valid number".red
            get_golfer_handicap
        else
            return handicap
        end
    end

    def get_reservation_time
        puts "\nPlease enter the time and date of your reservation".yellow
        puts "Format: (ex: 7:00AM 01/01/2020)".yellow
        reservation = gets.chomp
    end

    def get_course
        puts "\nWould you like to see a list of valid courses?(y/n)".yellow
        user_input = gets.chomp.downcase
        if user_input == 'y'
            find_courses
            puts "\nEnter a course name:".yellow
        elsif user_input == 'n'
            puts "\nEnter course name:".yellow
        else
            puts "\nNot a valid command".red
            get_course
        end

        course_name = gets.chomp
        course = Course.find_by(name: course_name)

        if course == nil
            puts "\nCourse not found. Please enter a valid course name:".red
            get_course
        else
            return course
        end
    end

    def get_party_size
        puts "\nPlease enter number of golfers in your party:".yellow
        party_size = Integer(gets) rescue false

        if party_size == false || party_size > 4 || party_size < 1
            puts "\nError: Party size must be a number 1-4. Please enter a valid number.".red
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

    def make_reservation
        puts "\nAre you already a registered golfer?(y/n)".yellow
        user_input = gets.chomp.downcase
        if user_input == 'y'
            golfer = find_golfer
        elsif user_input == 'n'
            golfer = create_new_golfer(get_golfer_name, get_golfer_age, get_golfer_handicap)
        else
            puts "\nNot a valid command.".red
            make_reservation
        end

        create_new_teetime(get_reservation_time, get_course, golfer, get_party_size)
        puts "\nYour reservation has been made.".yellow
    end

    def cancel_reservation
        reservation = find_reservation
        puts "\nIs this the reservation you would like to cancel? (y/n)".yellow
        user_input = gets.chomp.downcase

        if user_input == 'n'
            return
        elsif user_input == 'y'
            reservation.destroy
            puts "\nReservation has been cancelled.".yellow
        end
    end

    def find_golfer
        Golfer.find_by(name: get_golfer_name, age: get_golfer_age, handicap: get_golfer_handicap)
    end

    def find_reservations
        golfer = find_golfer

        if golfer == nil
            puts "Sorry golfer not found".red
            return
        end

        reservations = Teetime.where(golfer: golfer)

        if reservations == nil
            puts "\nSorry, no reservations found.".red
        else
            teetimes = reservations.map{|reservation|"\nReservation Time: #{reservation.reservation_time}\nCourse: #{reservation.course.name}\nParty Size: #{reservation.party_size}".green}
            puts teetimes
        end
        reservations
    end

    def find_reservation
        golfer = find_golfer
        
        if golfer == nil
            puts "\nSorry golfer not found.".red
            return
        end

        reservation_time  = get_reservation_time
        reservation = Teetime.find_by(golfer: golfer, reservation_time: reservation_time)

        if reservation == nil
            puts "\nSorry, reservation not found.".red
            return
        else
            puts "\nReservation Time: #{reservation.reservation_time}\nParty Size: #{reservation.party_size}".yellow
        end
        reservation
    end

    def change_party
        reservation = find_reservation

        if reservation == nil
            return
        end
        
        puts "\nIs this the reservation you would like to update? (y/n)".yellow
        user_input = gets.chomp.downcase

        if user_input == 'n'
            return
        elsif user_input == 'y'
            reservation.party_size = get_party_size
            reservation.save
            puts "\nReservation has been updated.".yellow
        end
    end

    def change_handicap
        golfer = find_golfer

        if golfer == nil
            puts "\nSorry golfer not found.".red
            return
        else
            puts "\nName: #{golfer.name}\nAge: #{golfer.age}\nHandicap: #{golfer.handicap}".yellow
        end
        
        puts "\nIs this the golfer you would like to update? (y/n)".yellow
        user_input = gets.chomp.downcase

        if user_input == 'n'
            return
        elsif user_input == 'y'
            golfer.handicap = get_golfer_handicap
            golfer.save
            puts "\nGolfer handicap has been updated.".yellow
        end
    end

    def find_courses
        courses = Course.all.map do |course|
            "Course: #{course.name} | Cost: $#{course.cost} | Driving Range: #{course.driving_range} | Public: #{course.public}".green
        end
        puts "\n"
        puts courses 
    end

    def course_weather
        course = get_course
        weather_data = Weather.get_weather_data(course.latitude, course.longitude)
        puts "\nCurrent Weather: #{weather_data["weather"][0]["description"]}".green
        puts "Temperature: #{weather_data["main"]["temp"].round}°F".green
        puts "Feels Like: #{weather_data["main"]["feels_like"].round}°F".green
        puts "Wind Speed: #{weather_data["wind"]["speed"].round} mph\n".green
    end

end