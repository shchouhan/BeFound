class AppliedJobsController < ApplicationController
#   before_action :set_job_post, only: %i[show edit update destroy]
    
#     def index
#       if current_user.user_type == "worker"
#         @applied_jobs = AppliedJob.where("user_id = ?", current_user.id)
#           if @job_posts == nil
#             redirect_to root_path, notice: 'You have not applied for any job posts yet!'
#           end
#       else
#         @applied_jobs = JobPost.all
#       end
#     end
        
#     def search
      
#       @applied_jobs = JobPost.where("category_id = ?",params[:category_id])
    
#     end
        
#     def new
       
#       @applied_job = AppliedJob.new
      
#     end
        
#     def create
#       byebug  
#       @user_id = current_user.id
#       params[:applied_job][:user_id] = @user_id
#       params[:applied_job][:post_id] = @post_id
#       @applied_job = AppliedJob.new(job_post_params)
#       if @applied_job.save
            
#         redirect_to root_path, notice: 'You have applied for this job successfully!'#{params[:id]}"
      
#       else
          
#         render "new", status: :unprocessable_entity
        
#       end
#     end
        
#     def show
          
#     end
        
#     def edit
      
#     end
      
#     def update
        
      
#     end
        
#     def destroy
    
      
#     end
        
#     private
        
#     def job_post_params
          
#       params.require(:job_post).permit( :job_role, :category_id,:job_description, :vacancies, :user_id, :salary, :qualification)
      
#     end
        
#     def set_job_post
        
#       @job_post = JobPost.find(params[:id])
      
#     end
        
end