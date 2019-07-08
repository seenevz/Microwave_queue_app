class User < ApplicationRecord
  has_many :lines
  has_many :microwaves through: :lines
end
