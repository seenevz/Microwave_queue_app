class User < ApplicationRecord
  has_many :lines
  has_many :microwaves, through: :lines

  has_secure_password
end
