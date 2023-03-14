class CreateJobPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :job_posts do |t|
      t.string :job_role
      t.text :job_description
      t.integer :vacancies
      t.integer :salary
      t.text :qualification
      t.references :user, foreign_key:true
      t.references :category, foreign_key:true
      t.timestamps
    end
  end
end
