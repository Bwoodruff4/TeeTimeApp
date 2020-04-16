class Golfer < ActiveRecord::Base
    has_many :teetimes
    has_many :courses, through: :teetimes
    
    def self.average_age
        total_sum = Golfer.all.reduce(0) do |sum, golfer|
            sum + golfer.age
        end
        total_age = Golfer.all.length
        (total_sum.to_f / total_age).round(2)
    end

    def self.average_handicap
        total_sum = Golfer.all.reduce(0) do |sum, golfer|
            sum + golfer.handicap
        end
        total_number_handicaps = Golfer.all.length
        (total_sum.to_f / total_number_handicaps).round(1)
    end
end