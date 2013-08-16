class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :word
      t.datetime :date

      t.timestamps
    end
    add_index :plays, :word_id
  end
end
