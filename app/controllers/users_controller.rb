class UsersController < ApplicationController
    before_action :set_user, except: [:new, :create, :index]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            flash[:notice] = "Hi #{@user.username},you've successfully signed up"
            redirect_to articles_path
        else
            render "new", status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Account Information of #{@user.username} was successfully updated"
            redirect_to articles_path
        else
            render "edit"
        end
    end

    def index
        @users = User.all
    end

    def show
        @user_articles = @user.get_user_articles.paginate(page: params[:page], per_page: 5)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
