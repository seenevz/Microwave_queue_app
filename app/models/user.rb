class User < ApplicationRecord
  has_many :timers
  has_many :microwaves, through: :timers

  has_secure_password
end
