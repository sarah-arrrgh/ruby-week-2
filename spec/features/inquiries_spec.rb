require 'rails_helper'

RSpec.feature "Inquiries", type: :feature do
  scenario 'they see the form on the page' do
    visit contact_path

    expect(page).to have_selector('form')
  end
end
