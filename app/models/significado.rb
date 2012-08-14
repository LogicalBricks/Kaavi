class Significado < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :traducciones

  validates :palabra, presence: true 
  validates :palabra, uniqueness: true
end
