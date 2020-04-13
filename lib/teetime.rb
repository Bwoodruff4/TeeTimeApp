class TeeTime < ActiveRecord::Base
    belongs_to :golfer
    belongs_to :course
end