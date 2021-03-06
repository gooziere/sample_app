class UsersController < ApplicationController
  
	def show
	@user = User.find(params[:id])
	@titre = @user.nom
	end

	def new
	@user=User.new
	@titre = "Inscription"
	end
  
    def create
		@user=User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success]="Bienvenue dans l'Application Exemple!"
			redirect_to @user
		else
		  @titre = "Inscription"
		  render 'new'
		end
	end
	
	private
	def user_params
		params.require(:user).permit(:nom, :email, :password, :password_confirmation)
	end
end
