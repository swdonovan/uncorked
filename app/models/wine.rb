class Wine < ApplicationRecord
  validates_presence_of :name, :vintage, :rating
  validates_uniqueness_of :name

  has_many :venue_wines
  has_many :venues, through: :venue_wines
end
