class CreatePublishers < ActiveRecord::Migration[7.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
