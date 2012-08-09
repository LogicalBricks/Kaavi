class Palabra < ActiveRecord::Base

  attr_accessible :lugar, :palabra

  has_and_belongs_to_many :traducciones, autosave: true

  validates :palabra, presence: true 
  validates :palabra, uniqueness: true

  validate :significado_unico

  def significado_unico
    significados = self.traducciones.collect(&:significado_id)
    errors.add(:significados, "no puede repetirse") if significados.length != significados.uniq.length
  end

  def significados=(significados_input)
    puts "*"*20
    puts significados_input
    puts "*"*20

    significados_input = "" if !significados_input
    significados_array = significados_input.split(',') 
    self.traducciones = []
    significados_array.each do |id|
     # if id.to_i > 0 
        significado = Significado.find(id)
        self.traducciones.build(significado: significado) if significado
     # end
    end
  end

  def significados_id_comma
    self.traducciones.collect(&:significado_id).join(',')
  end

  def significados_json
    significados = []
    self.traducciones.each do |t|
      significado = {}
      significado[:id]= t.significado.id
      significado[:text]= t.significado.palabra
      significados << significado
    end 
    significados.empty? ? 'null' : significados.to_json
  end
end
