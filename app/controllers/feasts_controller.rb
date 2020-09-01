class FeastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  def cancel
  end

  def show
  end

  def home
    @feasts = Feast.all

  end

  def index
  end

  def create
  end
end
