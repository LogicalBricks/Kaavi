class Palabra < ActiveRecord::Base

  attr_accessible :lugar, :palabra, :audio
  mount_uploader :audio, AudioUploader

  has_and_belongs_to_many :traducciones, autosave: true

  validates :palabra, presence: true 
  validates :palabra, uniqueness: true

  validate :significado_unico

  def significado_unico
    significados = self.traducciones.collect(&:significado_id)
    errors.add(:significados, "no puede repetirse") if significados.length != significados.uniq.length
  end

  def significados=(significados_input)
    significados_input = "" if !significados_input
    significados_array = significados_input.split(',') 
    self.traducciones = []
    significados_array.each do |id|
      significado = Significado.find(id)
      self.traducciones.build(significado: significado) if significado
    end
  end

  def relacionar_variante(palabra)
    self.traducciones = palabra.traducciones if palabra
  end


end
