class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :notebook, index: true
      t.string :title, limit: 200
      t.text :content

      t.timestamps
    end
  end
end
