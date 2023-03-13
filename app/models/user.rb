class User < ApplicationRecord
  has_many :job_posts
  has_many :applied_jobs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #validates :user_name, presence: { message: "Must be given please" }#,format: { with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed!" }
         validates :username, :email, :encrypted_password, :address,  presence: true
         validates :contact, presence: {message: "Please enter only numbers!"}, numericality: true, length: { in:10..12}
end
