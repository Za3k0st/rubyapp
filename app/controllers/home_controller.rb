class HomeController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :contact]
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
    params[:filterrific],
    select_options: {
        sorted_by: User.options_for_sorted_by,
        with_country_id: Country.options_for_select
      },
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

  def show

  end

  def contact
    if request.post?
      @user.firstname = params[:firstname]
      UserMailer.welcome_email(@user).deliver_now
      redirect_to action: "index"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email)
  end
end
