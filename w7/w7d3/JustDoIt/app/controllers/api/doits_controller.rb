class Api::DoitsController < ApplicationController
  def index
    render json: Doit.all
  end

  def create
  end

  def update

  end

  def destroy

  end
end
