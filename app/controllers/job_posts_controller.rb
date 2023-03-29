class JobPostsController < ApplicationController
before_action :set_job_post, only: %i[show edit update destroy]
before_action :authenticate_user!
load_and_authorize_resource :except => [:apply, :show_applies]

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
    if current_user.user_type == "contractor"
      @job_posts = JobPost.where("category_id = ? AND user_id = ?",params[:category_id], current_user.id)
    else
      @job_posts = JobPost.where("category_id = ?",params[:category_id])
    end
    if @job_posts.empty?
      redirect_to job_posts_path, notice: 'There are no search results in this category!'
    end
  end

  def new
    @job_post = JobPost.new

  end

  def create
    params[:job_post][:user_id] = current_user.id
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

  def apply
    #render "job_application"
    if AppliedJob.where("job_post_id = ? AND user_id = ?", params[:id],current_user.id).exists? 
      redirect_to job_posts_path(@job_post), notice: 'You have already applied for this job!'

    else
      
      AppliedJob.create(user_id: current_user.id, job_post_id: params[:id])
      redirect_to job_posts_path(@job_post), notice: 'You have applied for this job successfully!'
    
    end
 
  end

  def show_applies
    
    if current_user.user_type == "contractor"

      @applied_jobs =  AppliedJob.joins(:job_post).where(job_posts: {user_id: current_user.id}) 
      
      @applications = @applied_jobs.where("job_post_id = ?", params[:id])
      
      if @applications.empty?
        
        redirect_to job_posts_path, notice: 'There are no job applications on this job post yet!'
      end
    else
      @applied_jobs = AppliedJob.where("user_id = ?",current_user.id)
      if @applied_jobs.empty?
        redirect_to root_path, notice: 'You have not applied for any job_post yet!'
      end
      #redirect_to job_posts_path
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
