class Schema < ApplicationRecord

  has_and_belongs_to_many :queries
  has_many :fields

end
