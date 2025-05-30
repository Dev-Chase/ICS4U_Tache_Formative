class Country < ApplicationRecord
  has_many :authors
  has_many :publishers

  # Explicitly Listing Allowed Associations and Attributes for ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    ["authors", "publishers"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
end
