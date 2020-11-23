class CreateMedicalRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_records do |t|
      t.string :title
      t.date :recorded_date
      t.references :patient

      t.timestamps
    end
  end
end
