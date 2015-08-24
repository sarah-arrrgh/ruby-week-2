class InquiriesController < ApplicationController

  def new
  end

  def create
    flash.notice = "Thank you for sending us a message."
    redirect_to root_url
  end
end
