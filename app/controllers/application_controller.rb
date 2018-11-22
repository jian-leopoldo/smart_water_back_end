class ApplicationController < ActionController::API
  before_action :require_authentication!, except: [:login]
  
  def login
    adm = User.find_by(email: params[:email])
    response = "Usuário não encontrado!"
    response = adm.as_json if adm.present? && adm.valid_password?(params[:password])
    render json: { response: response }
  end

  private 

  def require_authentication!
    @admin = User.find_by(email: request.headers['email'],authentication_token: request.headers['token'])
    render json:  { errors: "Não autorizado" } unless @admin.present?  
  end

end
