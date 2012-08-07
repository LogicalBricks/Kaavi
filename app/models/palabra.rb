class Palabra < ActiveRecord::Base

  attr_accessible :lugar, :palabra
  has_and_belongs_to_many :traducciones

  validates :palabra, presence: true 
  validates :palabra, uniqueness: true

end
