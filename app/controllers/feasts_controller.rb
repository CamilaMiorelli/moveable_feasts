class FeastsController < ApplicationController
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
