class UsersController < ApplicationController

    def index
        users = User.all 
        render json: UserSerializer.new(users)
    end

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user)
    end

    def new
        user = User.new
    end

    def create
        user = User.create(user_params)
        render json: UserSerializer.new(user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :gender)
    end

end
