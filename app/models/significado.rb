class Significado < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :traducciones
end
