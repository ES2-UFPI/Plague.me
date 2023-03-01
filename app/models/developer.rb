class Developer < ApplicationRecord
    validates :name_developer, :description_developer, presence: true
    has_many :games
end
