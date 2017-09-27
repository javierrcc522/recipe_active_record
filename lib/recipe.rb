class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:ingredients)

  before_save :valid
end

private

def valid
  validates_inclusion_of :rating, :in => 1..10
end
