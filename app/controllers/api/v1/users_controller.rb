class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
    def index
        users = User.all
        render json: users
    end
        # GET /users/1
        def show
            if @user
                render json: @user, include: [:comments, :listings, :followed_listings, :follow_listings => {:only => :created_at}]
            else
                render json: { message: "User not found!" }
            end
        end
      
        # POST /users
        def create
          @user = User.new(user_params)
      
          if @user.save
            render json: @user, status: :created, location: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      
        # PATCH/PUT /users/1
        def update
          if @user.update(user_params)
            render json: @user
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
            @user = User.find_by(id: params[:id])
          end
      
          # Only allow a trusted parameter "white list" through.
          def user_params
            params.require(:user).permit( :first_name, :last_name, :email, :password, :pro_pic, :city, :state, :realtor )
          end
      
end

           