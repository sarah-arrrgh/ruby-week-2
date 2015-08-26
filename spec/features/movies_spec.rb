require 'rails_helper'

RSpec.feature "Movies", type: :feature do
  scenario 'user can add a movie' do
    visit new_movie_path

    fill_in 'Title', with: "Citizen Kane"
    fill_in 'Director', with: "Orson Welles"
    fill_in 'Genre', with: "Drama"
    fill_in 'Year', with: 1941

    click_button 'Create Movie'

    expect(page).to have_content('Thank you')
  end

  scenario 'user can list all movies' do
    Movie.create(title: "Citizen Kane", director: "Orson Welles", genre: "Drama", year: 1941)

    visit movies_path

    expect(page).to have_content('Citizen Kane')
  end

end

