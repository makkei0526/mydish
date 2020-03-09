class CreateDishTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_tag_relations do |t|
      t.references :dish, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
