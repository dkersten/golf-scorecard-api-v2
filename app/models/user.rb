class User < ApplicationRecord

    has_many :scorecards, -> { order('created_at ASC') }

    def holesPlayed
        scorecards = self.scorecards
        totalscores = []
        totalHoles = 0
        scorecards.map do |scorecard|
            if scorecard.f9_score != nil && scorecard.b9_score != nil
                totalHoles = totalHoles + 18
            elsif scorecard.f9_score != nil
                totalHoles = totalHoles + 9
            elsif
                scorecard.b9_score != nil
                totalHoles = totalHoles + 9
            end
        end
        totalHoles
    end

end
