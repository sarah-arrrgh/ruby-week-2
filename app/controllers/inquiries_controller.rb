class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

def create
  @inquiry = Inquiry.create(inquiry_params)

  if (@inquiry.valid?)
    InquiryMailer.inquiry_email(@inquiry).deliver_now

    flash[:notice] = "Thank you for sending us a message, #{@inquiry.name}"
    redirect_to root_url
  else
    render :new
  end
end

private
  def inquiry_params
    params.require(:inquiry).permit( :name, :email, :subject, :message )
  end
end
