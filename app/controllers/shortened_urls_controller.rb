class ShortenedUrlsController < ApplicationController
  #before_action :authenticate_user!


  def index
    @shortened_urls = ShortenedUrl.all.order('created_at DESC')
  end
  
  def new
    @shortened_url = ShortenedUrl.new()
  end
  
  def create
    # params[:shortened_url][:original_url] = params[:original_url]
    @shortened_url = ShortenedUrl.new()
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    # @original_url =ShortenedUrl.new() 
    #if @short_url.nil?
      #render :new,  status: :unprocessable_entity
    #else
    #@shortened_url.short_url = generate_short_url
    #@shortened_url.short_url = @short_url
    
    if @shortened_url.save
      render :show,  status: :created
    else
      render :new,  status: :unprocessable_entity, notice: 'Url already exists'
    end
  end 

  def show
    
    @shortened_url = ShortenedUrl.find_by_short_url(params[:id])
    #@shortened_url = ShortenedUrl.find(params[:id])
    #@shortened_url = ShortenedUrl.where("short_url = ?",(params[:id]))
    #@shortened_url = ShortenedUrl.where("id = ?",params[:id])
    #if @shortened_url
    
    if @shortened_url.original_url
       
      redirect_to @shortened_url.original_url,  allow_other_host: true
      @shortened_url.increment!(:click_count)
       
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

  def destroy
    
    ShortenedUrl.destroy(params[:id])
    #@shortened_url = ShortenedUrl.where("id = ?", params[:id])
    #@shortened_url.destroy
    #byebug
    redirect_to shortened_urls_path, notice: 'URL has been deleted successfully!'
  end

  private

  def shortened_url_params
    params.permit(:original_url)
    #params.require(:shortened_url).permit(:original_url)
  end

 end
