class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_profile
    @articles = current_user.articles
  end
end
