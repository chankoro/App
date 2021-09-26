class FamiliesController < ApplicationController
  
  def new
  end
  
  def  show
   @family = current_user.family
   @family_users = @family.users
  end
end
