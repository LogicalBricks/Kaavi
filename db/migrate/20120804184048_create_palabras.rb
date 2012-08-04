class CreatePalabras < ActiveRecord::Migration
  def change
    create_table :palabras do |t|
      t.string :palabra
      t.string :lugar

      t.timestamps
    end
  end
end
