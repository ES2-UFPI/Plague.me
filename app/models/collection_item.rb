class CollectionItem < ApplicationRecord
  belongs_to :collection
  belongs_to :game
end
