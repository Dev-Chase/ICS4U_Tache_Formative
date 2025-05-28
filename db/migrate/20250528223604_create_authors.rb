class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.date :birth_date

      t.timestamps
    end
  end
end
