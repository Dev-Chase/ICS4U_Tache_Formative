class Publisher < ApplicationRecord
  belongs_to :country

  # Explicitly Listing Allowed Associations and Attributes for ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    ["country"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "country_id", "created_at", "updated_at"]
  end
end
