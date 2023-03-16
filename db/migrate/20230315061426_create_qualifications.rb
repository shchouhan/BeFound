class CreateQualifications < ActiveRecord::Migration[7.0]
  def change
    create_table :qualifications do |t|
      t.text :qualification
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
