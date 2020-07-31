class User < ApplicationRecord

    has_many :scorecards, -> { order('created_at ASC') }

    def test
        scorecards = self.scorecards
        return scorecards
        # return "Fuck I think I have this"
    end

end
