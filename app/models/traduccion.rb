class Traduccion < ActiveRecord::Base
 #attr_accessible :title, :body
 has_and_belongs_to_many :palabras
 belongs_to :significado
end
