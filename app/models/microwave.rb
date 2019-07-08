class Microwave < ApplicationRecord
    has_many lines:
    has_many :users through: :lines
end
