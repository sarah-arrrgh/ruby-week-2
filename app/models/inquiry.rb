class Inquiry
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  validates :email, presence: true
  field :subject, type: String
  field :message, type: String
end
