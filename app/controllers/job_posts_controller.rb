class JobPostsController < ApplicationController
before_action :set_job_post, only: %i[show edit update destroy]


def index
  
  if current_user.user_type == "contractor"
    @job_posts = JobPost.where("user_id = ?", current_user.id)
    if @job_posts == nil
      redirect_to root_path, notice: 'You have not created any job posts yet!'
    end
  else
    @job_posts = JobPost.all
  end
end

def search

  @job_posts = JobPost.where("category_id = ?",params[:category_id])

end

def new
  @job_post = JobPost.new
  
end

def create
  
  @user_id = current_user.id
  params[:job_post][:user_id] = @user_id
  @job_post = JobPost.new(job_post_params)
  if @job_post.save
    
    redirect_to root_path, notice: 'Your Job Post has been created successfully!'#{params[:id]}"
  else
    render "new", status: :unprocessable_entity
  end
end

def show
  
end

def edit
end
def update
  if @job_post.update(job_post_params)
  redirect_to job_post_path(@job_post), notice: 'Your Job Post has been updated successfully!'
  else
  render :edit
  #   # render plain: "OK"
  end
end

def destroy
  @job_post.destroy
  #byebug
  redirect_to job_posts_path, notice: 'Job Post has been deleted successfully!'
end

private
def job_post_params
  params.require(:job_post).permit( :job_role, :category_id,:job_description, :vacancies, :user_id, :salary, :qualification)
end

def set_job_post
  @job_post = JobPost.find(params[:id])
end

end
