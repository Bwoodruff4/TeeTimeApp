class Teetime < ActiveRecord::Base
    belongs_to :golfer
    belongs_to :course

    
    def self.average_party_size
        total_sum = Teetime.all.reduce(0) do |sum, party_size|
            sum + Teetime.party_size
        end
        total_tee_times = Teetime.all.length
        (total_sum.to_f / total_tee_times).round(2)
    end
end