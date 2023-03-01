class Publisher < ApplicationRecord
    validates :name_publisher, :description_publisher, presence: true
    has_many :games
end
