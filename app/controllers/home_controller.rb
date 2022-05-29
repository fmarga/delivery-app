class HomeController < ApplicationController 
  def index
    @search_budgets = SearchBudget.all unless !admin_signed_in?
  end
end