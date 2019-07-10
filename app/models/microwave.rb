class Microwave < ApplicationRecord
  has_many :timers
  has_many :users, through: :timers
end
