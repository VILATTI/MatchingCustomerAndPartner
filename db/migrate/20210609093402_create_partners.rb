class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name

      t.string :flooring_materials, array: true
      t.float :rating

      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
