class Golfer < ActiveRecord::Base
    has_many :teetimes
    has_many :courses, through: :teetimes
end