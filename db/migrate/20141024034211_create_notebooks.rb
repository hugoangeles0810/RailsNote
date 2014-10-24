class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.references :user, index: true
      t.string :name, limit: 200
      t.text :description

      t.timestamps
    end
  end
end
