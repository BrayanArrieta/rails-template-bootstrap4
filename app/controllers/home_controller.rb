class HomeController < ApplicationController
  before_action :authenticate_user!
  layout "root"
  # , except: [:index, :faqs]
  def index

  end
end
