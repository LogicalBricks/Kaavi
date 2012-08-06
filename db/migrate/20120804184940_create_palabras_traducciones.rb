class CreatePalabrasTraducciones < ActiveRecord::Migration
  def change
    create_table :palabras_traducciones, id: false do |t|
      t.references :palabra
      t.references :traduccion
    end
  end
end
