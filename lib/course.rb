class Course < ActiveRecord::Base
    has_many :teetimes
    has_many :golfers, through: :teetimes
end