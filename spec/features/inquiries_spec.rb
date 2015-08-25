require 'rails_helper'

# RSpec.feature "Inquiries", type: :feature do
#   scenario 'they see the form on the page' do
#     visit contact_path

#     expect(page).to have_selector('form')
#   end
  # end

RSpec.feature "Inquiries", type: :feature do
  scenario 'user can complete and submit the form' do
    visit contact_path

    fill_in 'Name', with: "Joe Mama"
    fill_in 'Email', with: "joe@mama.com"
    fill_in 'Subject', with: "More beer!"
    fill_in 'Message', with: "And let's get some donuts in here!"

    click_button 'Send message'

    expect(page).to have_content('Thank you')
  end
end
