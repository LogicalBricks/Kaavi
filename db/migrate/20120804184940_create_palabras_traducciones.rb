class CreatePalabrasTraducciones < ActiveRecord::Migration
  def change
    create_table :palabras_significados, id:false do |t|
      t.references :significado

      t.timestamps
    end

  end

end
