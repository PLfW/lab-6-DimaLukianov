module AdminSection
  class UsersController < AdminSectionController
    def index
      @users = User.all
    end

    def change_role
      @user = User.find_by params[:id]
      if @user.update(is_teacher: !@user.is_teacher)
        respond_to :js
      else
        respond_to do |format|
          format.js { render action: 'change_role_error' }
        end
      end
    end
  end
end
