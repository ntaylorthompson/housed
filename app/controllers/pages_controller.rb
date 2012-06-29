class PagesController < ApplicationController
  before_filter :signed_in_user, only: :email_settings
  before_filter :active_user, only: :email_settings
  
  def home
    @guests = 0
    if not current_user.nil?
      current_user.shows.each do |show|
        @guests += show.tickets_sold
      end
    end
    
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def welcome
  end
  
  def email_settings
  end
  
  def payment_error
  end
  
  def guest_thank_you
  end
  
end
