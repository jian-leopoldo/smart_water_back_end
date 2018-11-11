class LocalesController < ApplicationController
  before_action :set_locale, only: [:show, :destroy, :update]

  def index
    @locales = Locale.all
    render json: @locales.to_json
  end

  def show
    render json: @locale.to_json
  end

  def destroy
  end

  def update

  end

  def create
    @locale = Locale.new(locale_params)
    if @locale.save
      render json: @locale.to_json
    else
      render json: @local.errors.to_json
    end
  end


  private 

  def locale_params
    params.require(:locale).permit(:title, :description, :address)    
  end

  def set_locale
    @locale = Locale.find(params[:id])
  end

end
