require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @inquiry = Inquiry.new
    @inquiry.name = "Joe"
    @inquiry.email = "joe@mama.com"
    @inquiry.subject = "Beer"
    @inquiry.message = "Gimme some."

    InquiryMailer.inquiry_email(@inquiry).deliver_now
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send the email' do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  it 'renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to eq([ @inquiry.email ])
  end

  it 'should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Beer")
  end

  it 'renders the sender email' do
    expect(ActionMailer::Base.deliveries.first.from).to eq([ "from@example.com" ])
  end

end
