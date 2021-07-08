class SupportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_job_change_dog, only: [:index, :create]
  before_action :support_completed, only: [:index, :create]
  
  def index
    @support = Support.new  
  end

  def create
    @support = Support.new(user_id: current_user.id, job_change_dog_id: params[:job_change_dog_id])#必ずしもストロングパラメーターを使ってデータを格納するわけではない
    
    
    if @support.valid?
      pay_item
      @support.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @job_change_dog.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def set_job_change_dog
    @job_change_dog = JobChangeDog.find(params[:job_change_dog_id])
  end
  def support_completed
    if @job_change_dog.support.present?
      redirect_to root_path
    end
  end
end
