class DashboardController < ApplicationController
  before_action :update_visit_count
  
  def index
  end

  def update_visit_count
    current_visitor.update(page_visits: current_visitor.page_visits + 1, last_visit: Time.now)
  end
end
