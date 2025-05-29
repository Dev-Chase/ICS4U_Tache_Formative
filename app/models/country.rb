class Country < ApplicationRecord
  has_many :authors
  has_many :publishers
end
