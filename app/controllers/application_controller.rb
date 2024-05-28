class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
#ActionController::Baseを継承しており、これはRailsの標準的なコントローラー機能を提供します。
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  #Deviseが提供するdevise_parameter_sanitizerを使用して、サインアップ時に許可されるパラメータを追加しています。
  #具体的には、:nicknameというパラメータをサインアップ時に許可するように設定しています。
end
