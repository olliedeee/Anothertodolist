class PagesController < ApplicationController
  
  def home
    if user_signed_in?
          redirect_to todos_path
        else
          redirect_to new_user_session_path
    end
  end
  
  def about
    
  end
  
  def help
    
  end
  
end