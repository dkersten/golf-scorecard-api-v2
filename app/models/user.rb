class User < ApplicationRecord

    has_many :scorecards, -> { order('created_at ASC') }

    def test
        scorecards = self.scorecards
        return scorecards
    end

    def holeNum
        scorecards = self.scorecards
        totalscores = []
        f9Total = scorecards.map do |scorecard|
            f9 = scorecard.id
            f9
        end
        return f9Total
    end

end
