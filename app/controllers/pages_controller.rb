class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:banner, :home]
  def home
  end

  def banner
    render layout: false
  end

end
