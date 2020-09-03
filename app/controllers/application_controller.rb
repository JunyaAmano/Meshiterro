class ApplicationController < ActionController::Base
  # deviseのコントローラーはライブラリで用意されており、直接修正できないためapplicationのコントローラーに記載
  # before_actionはコントローラーが動作する前に実行される
  before_action :authenticate_user! #deviseの機能。ログイン認証がされていない場合にログイン画面にリダイレクトされる。
  # deviseの機能の利用をする場合はconfigure_permitted_parametersが実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # 
  protected
  
  def configure_permitted_parameters
    # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作が許可される
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
