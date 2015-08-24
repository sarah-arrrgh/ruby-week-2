require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  it 'gets and sets name, email, subject, and message' do
    inquiry = Inquiry.new
    inquiry.name = "Joe"
    inquiry.email = "joe@mama.com"
    inquiry.subject = "Beer"
    inquiry.message = "Gimme some."

    expect(inquiry.name).to eq("Joe")
    expect(inquiry.email).to eq("joe@mama.com")
    expect(inquiry.subject).to eq("Beer")
    expect(inquiry.message).to eq("Gimme some.")
  end
end
