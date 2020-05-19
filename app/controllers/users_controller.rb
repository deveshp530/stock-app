class UsersController < ApplicationController
  def portfolio
    @tracked_stock = current_user.stocks
  end
end
