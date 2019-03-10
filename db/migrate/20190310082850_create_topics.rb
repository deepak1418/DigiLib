class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :sub
      t.string :cover

      t.timestamps
    end
  end
end
