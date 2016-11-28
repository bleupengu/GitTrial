	class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :text
      t.references :book, foreign_key: true
      t.references :head, foreign_key: true
      t.references :node, foreign_key: true
      t.references :creator, foreign_key: true
      t.timestamps
    end
  end
end
