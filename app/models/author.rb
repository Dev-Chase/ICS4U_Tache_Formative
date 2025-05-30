class Author < ApplicationRecord
  has_many :books
  belongs_to :country

  validate :birth_date_cannot_be_in_the_future

  # Explicitly Listing Allowed Associations and Attributes for ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    ["books", "country"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "country_id", "birth_date", "created_at", "updated_at"]
  end

  # Custom Validations
  private

  def birth_date_cannot_be_in_the_future
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, "ne peut pas etre dans le futur")
    end
  end
end
