class CreateSignificados < ActiveRecord::Migration
  def change
    create_table :significados do |t|
      t.string :palabra
      t.timestamps
    end
  end
end
