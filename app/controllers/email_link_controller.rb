class EmailLinkController < ApplicationController

  def new

  end

  def create
    @email_link= EmailLink.generate(params[:email])
    if @email_link
      redirect_to new_user_session_path, notice: 'Please check your mail tray.'
    else
      redirect_to new_user_session_path, notice: 'Not exist a user associated for that email.'
    end
  end
end
