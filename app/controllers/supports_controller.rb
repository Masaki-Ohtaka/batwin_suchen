class SupportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_job_change_dog, only: [:index, :create]
  
  def index
    @support = Support.new  
  end

  def create
    @support = Support.new(support_params)
    if @support.valid?
      pay_item
      @support.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def support_params
    params.require(:support).merge(user_id: current_user.id, job_change_dog_id: params[:job_change_dog_id], token: params[:token])
  end
  def set_job_change_dog
    @job_change_dog = JobChangeDog.find(params[:job_change_dog_id])
  end

end
