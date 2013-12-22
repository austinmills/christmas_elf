class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :gifts
      t.integer :quickies
      t.integer :smfls

      t.timestamps
    end
  end
end
