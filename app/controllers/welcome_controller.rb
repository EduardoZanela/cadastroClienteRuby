class WelcomeController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]
  def index
  end
end