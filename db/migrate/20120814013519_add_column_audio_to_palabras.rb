class AddColumnAudioToPalabras < ActiveRecord::Migration
  def change
    add_column :palabras, :audio, :string
  end
end
