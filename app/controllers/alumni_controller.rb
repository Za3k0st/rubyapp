class AlumniController < ApplicationController

  def show

    @user = User.find(params[:id])
  end

  def contact
    @user = User.find(params[:id])
    if request.post?
      UserMailer.welcome_email(@user).deliver_now
      redirect_to action: "show", id: @user.id
    end
  end

  def index
    @test = ''
    @users = User.all
    @users_by_country = User.group(:country_id).count
    @users_by_country.each do |country|
      @countries = Country.all.where(id: country[0])
      @test += "['"+@countries[0].name+"',"+country[1].to_s+"]"
    end
    @filterrific = initialize_filterrific(
    User,
    params[:filterrific]
  ) or return
  @users = @filterrific.find.page(params[:page])


  respond_to do |format|
    format.html
    format.js
  end

  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end

end
