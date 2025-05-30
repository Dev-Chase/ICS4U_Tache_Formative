class Genre < ApplicationRecord
  has_many :books

  # Explicitly Listing Allowed Associations and Attributes for ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
end
