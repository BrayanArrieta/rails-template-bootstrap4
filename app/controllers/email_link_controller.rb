class EmailLinkController < ApplicationController

  def new

  end

  def create
    @email_link = EmailLink.generate(params[:email])
    if @email_link
      redirect_to new_user_session_path, notice: 'Please check your mail tray.'
    else
      redirect_to new_user_session_path, notice: 'Not exist a user associated for that email.'
    end
  end

  def validate
    email_link=EmailLink.where(token: params[:token]).where('expires_at > ?',DateTime.now()).first
    unless email_link
      redirect_to new_user_session_path, notice: 'Invalid link or already expired, try with a new link.'
    end
    sign_in(email_link.user, scope: User)
    redirect_to root_path
  end
end
