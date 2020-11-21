class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.integer :gender
      t.date :dob
      t.integer :marital_status

      t.timestamps
    end
  end
end
