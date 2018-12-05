class ApplicationController < ActionController::API
  before_action :require_authentication!, except: [:login, :create_user]
  
  def login
    adm = User.find_by(email: params[:email])
    response = adm.as_json if adm.present? && adm.valid_password?(params[:password])
    if response.present?
      render json: { response: response }
    else
      render json: { response: response }, status: 403 
    end
  end

  private 

  def require_authentication!
    @admin = User.find_by(email: request.headers['email'],authentication_token: request.headers['token'])
    render json:  { errors: "Não autorizado"  }, status: 403 unless @admin.present?  
  end

end
