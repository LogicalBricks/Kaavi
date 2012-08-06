class CreateTraducciones < ActiveRecord::Migration
  def change
    create_table :traducciones do |t|
      t.references :significado
      t.timestamps
    end
  end
end
