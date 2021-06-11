class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :birthday, :gender, :first_name, :last_name, :first_kana, :last_kana, :postal_code, :location_id, :municipality, :address, :building_name, :phone_number])
  end
end
