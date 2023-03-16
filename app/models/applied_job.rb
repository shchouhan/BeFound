class AppliedJob < ApplicationRecord
  belongs_to :user  
  belongs_to :job_post 
  validates :user_id, uniqueness: {scope: :job_post_id}
  #validates :user_id, uniqueness: {message: "You have already applied for this job!"}
end
