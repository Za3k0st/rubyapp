class AlumniController < ApplicationController
  def index
    @users = User.all
  end
end
