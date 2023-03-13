class Category < ApplicationRecord
	has_many :job_posts
	validates :category_name, uniqueness: true
end
