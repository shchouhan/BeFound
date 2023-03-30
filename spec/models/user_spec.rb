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

  it "is invalid without an email address" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "has many job_posts" do
    user = User.new(user_name: "john_doe", email: "john@example.com", password: "password", contact: "1234578900", address: "nfoirngo4ghtrh")
    byebug
    job_post1 = JobPost.create(job_role: "role1", job_description: "This is the first job_post", category_id: 2, user: user)
    byebug
    job_post2 = JobPost.create(job_role: "role2", job_description: "This is the second job_post", category_id: 2, user: user)
    byebug
    expect(user.job_posts).to eq([job_post1, job_post2])
  end
  
  let(:user) { build(:user, name: nil, email: 'john.doe@example.com') }
  it 'is invalid without a name' do
    expect(user).to_not be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
