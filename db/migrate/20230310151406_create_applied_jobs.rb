class CreateAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :applied_jobs do |t|
      t.references :user, foreign_key:true
      t.references :job_post, foreign_key:true
      t.timestamps
    end
  end
end
