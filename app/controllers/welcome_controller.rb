class WelcomeController < ApplicationController
  def index
    session[:user_name] = "Curso de Ruby on Rails [SESSION]"
    cookies[:curso] = "Curso de Ruby on Rails [COOKIE]"
    @nome = params[:nome]
  end
end
