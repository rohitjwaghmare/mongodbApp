class Person
  include Mongoid::Document
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :notes, type: String
end
