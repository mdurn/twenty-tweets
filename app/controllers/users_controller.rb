class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'application'

  def overview
    @user = current_user
  end
end
