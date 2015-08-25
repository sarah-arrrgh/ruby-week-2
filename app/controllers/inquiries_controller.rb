class InquiriesController < ApplicationController
  def new
  end

  def create
    inquiry = Inquiry.create(inquiry_params)

    InquiryMailer.inquiry_email(inquiry).deliver_now

    flash[:notice] = "Thank you for sending us a message, #{inquiry.name}"
    redirect_to root_url
  end

  private

  def inquiry_params
    params.require(:inquiry).permit( :name, :email, :subject, :message )
  end
end
