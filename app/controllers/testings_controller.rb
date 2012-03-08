class TestingsController < ApplicationController
  def show
  	@testing = Testing.find(params[:id])
  end
end
