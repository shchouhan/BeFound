class CreateAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :applied_jobs do |t|

      t.timestamps
    end
  end
end
