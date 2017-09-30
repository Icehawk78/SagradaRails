class Cell < ApplicationRecord
  belongs_to :player
  belongs_to :coordinate
  belongs_to :color
  belongs_to :pip
end
