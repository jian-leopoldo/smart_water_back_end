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
  end


  private 

  def set_locale
    @locale = Locale.find(params[:id])
  end

end
