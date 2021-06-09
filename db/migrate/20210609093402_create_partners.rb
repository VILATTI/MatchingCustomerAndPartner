class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.json :flooring_materials
      t.string :address
      t.integer :operating_radius_km
      t.float :rating

      t.timestamps
    end
  end
end
