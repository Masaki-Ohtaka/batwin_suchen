class JobChangeDogsController < ApplicationController
  before_action :set_job_change_dog, only: [:edit, :update,:show]
  before_action :authenticate_foundation!, only: [:new, :edit, :update, :destroy]
  def index
    @job_change_dogs = JobChangeDog.includes(:foundation)
    
  end

  def new
    @job_change_dog = JobChangeDog.new
  
    
  end

  def create
    @job_change_dog = JobChangeDog.create(job_change_dog_params)
    if @job_change_dog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    job_change_dog = JobChangeDog.find(params[:id])
    job_change_dog.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @job_change_dog.update(job_change_dog_params)
    if @job_change_dog.save
       redirect_to job_change_dog_path
    else
       render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @job_change_dog.comments.includes(:foundation,:user).order("created_at DESC")
  end

  private
   def job_change_dog_params
  #   params.require(:job_change_dog).permit(:name, :gender_id, :personality, :word, :image).merge(foundation_id: current_foundation.id)
    params.require(:job_change_dog).permit(:name, :age, :breed_id, :far_color,:gender_id, :personality, :surgery_id, :vaccine_id, :publication, :word, :price,dogs_images:[]).merge(foundation_id: current_foundation.id)
    
   end

  def set_job_change_dog
    @job_change_dog = JobChangeDog.find(params[:id])
  end

  # def move_to_index
  #   unless fondation_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
