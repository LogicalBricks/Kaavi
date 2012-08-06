class Traduccion < ActiveRecord::Base
 attr_accessible :palabra

 has_and_belongs_to_many :palabras
 belongs_to :significado
end
