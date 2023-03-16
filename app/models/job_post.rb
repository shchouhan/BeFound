class JobPost < ApplicationRecord
	belongs_to :user
	belongs_to :category
  	has_many :applied_jobs
	validates :category_id, :job_role, :job_description, :vacancies, :salary, :qualification, presence: true
end
