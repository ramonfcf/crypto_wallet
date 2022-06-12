class WelcomeController < ApplicationController
  def index
    cookies[:nome] = "Isso é um Cookie"
    session[:nome] = "Isso é uma Session"
    @nome = params[:nome]
  end
end
