class UsersController < ApplicationController
	 before_action :set_user, only: [:show, :update, :destroy]

	# GET /users
  def index
    @users = @organization.users.admin_role.list_results params

    @count = @users.length unless params[:q].blank?

    render json: @users, meta: { count: @count || @users.length }, root: root
  end

  # GET /users/1
  def show
    render json: @user, root: root
  end

  # POST /users
  def create
    @user = User.new user_params

    if @user.save
      render json: @user, status: :created, root: root
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_user_params)
      render json: @user, root: root
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email,
                                 :password)
  end

  end
end
