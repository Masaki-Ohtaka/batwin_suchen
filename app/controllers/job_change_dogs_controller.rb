class JobChangeDogsController < ApplicationController
  before_action :set_job_change_dog, only: [:edit, :show]
  # before_action :authenticate_fondation!, only: [:new, :edit, :update, :destroy]
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
    @job_change_dog = JobChangeDog.find(params[:id])
    @job_change_dog.update(job_change_dog_params)
    if @job_change_dog.save
       redirect_to foundation_job_change_dog_path
    else
       render :edit
    end
  end

  def show
  end
  private
   def job_change_dog_params
  #   params.require(:job_change_dog).permit(:name, :gender_id, :personality, :word, :image).merge(foundation_id: current_foundation.id)
    params.require(:job_change_dog).permit(:name, :breed_id, :far_color,:gender_id, :personality, :surgery_id, :vaccine_id, :publication, :word, dogs_images:[]).merge(foundation_id: current_foundation.id)
    
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
