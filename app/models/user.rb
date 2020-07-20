class User < ApplicationRecord

    has_many :scorecards, -> { order('created_at ASC') }

end
