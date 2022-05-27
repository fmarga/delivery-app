class SearchBudgetsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def new
    @budget = SearchBudget.new
  end

  def create
  end

  def show
  end

  private
  
  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end