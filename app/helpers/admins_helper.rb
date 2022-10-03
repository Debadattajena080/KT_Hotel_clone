# frozen_string_literal: true

module AdminsHelper

    def must_be_admin
        unless current_user.isAdmin?
        flash[:danger] = 'You must be an admin to perform this action'
        redirect_to root_path
        end
    end
    
end
