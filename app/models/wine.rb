class Wine < ApplicationRecord
  validates_presence_of :name, :vintage, :rating
  validates_uniqueness_of :name
end
