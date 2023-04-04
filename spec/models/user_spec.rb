require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(user_name: "john_doe", email: "john@example.com", password: "password", contact: "1234578900", address: "nfoirngo4ghtrh")
    expect(user).to be_valid
  end

  it "is not valid without a user_name" do
    user = User.new(email: "john@example.com", password: "password", contact: "1234578900", address: "nfoirngo4ghtrh")
    expect(user).to_not be_valid
  end

  # let(:user) { build(:user, user_name: nil, email: 'john.doe@example.com') }
  # it 'is invalid without a name' do
  #   expect(user).to_not be_valid
  #   expect(user.errors[:name]).to include("can't be blank")
  # end

  context "validations" do
    it "is invalid without a user name" do
      user = User.new(user_name: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without an email" do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end

    it "is invalid with a duplicate email" do
      existing_user = User.create(user_name: "John Doe", email: "john.doe@example.com")
      new_user = User.new(user_name: "Jane Doe", email: "john.doe@example.com")
      expect(new_user).not_to be_valid
    end
  end

  context "associations" do
    it "has many job_posts" do
      user = User.new(user_name: "John Doe", email: "john.doe@example.com")
      expect(user).to respond_to(:job_posts)
    end

    it "destroys associated posts when destroyed" do
      user = User.create(user_name: "John Doe", email: "john@example.com", password: "password", contact: "1234578900", address: "nfoirngo4ghtrh")
      byebug
      job_post = user.job_posts.create(job_role: "Job1", job_description: "First")
      user.destroy
      expect(JobPost.find_by_id(job_post.id)).to be_nil
    end

  # it "has many job_posts" do
  #   user = User.new(user_name: "john_doe", email: "john@example.com", password: "password", contact: "1234578900", address: "nfoirngo4ghtrh")
  #   byebug
  #   job_post1 = JobPost.create(job_role: "role1", job_description: "This is the first job_post", category_id: 2, user: user)
  #   byebug
  #   job_post2 = JobPost.create(job_role: "role2", job_description: "This is the second job_post", category_id: 2, user: user)
  #   byebug
  #   expect(user.job_posts).to eq([job_post1, job_post2])
  # end
  end
end
