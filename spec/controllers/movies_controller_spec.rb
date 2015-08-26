require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "DELETE destory" do
    it "destroys the requested movie" do
      movie = Movie.create(title: "X", director: "Y", genre: "Z", year: 2001)
      expect {
        delete :destroy, :id => movie.id
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = Movie.create(title: "X", director: "Y", genre: "Z", year: 2001)
      delete :destroy, :id => movie.id
      expect(response).to redirect_to(movies_url)
    end
  end
end
