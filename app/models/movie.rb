class Movie
  include Mongoid::Document

  field :title, type: String
  field :director, type: String
  field :genre, type: String
  field :year, type: Integer
end
