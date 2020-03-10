class AddUserIdToDishes < ActiveRecord::Migration[5.2]
  def change
    def up
      execute 'DELETE FROM dishes;'
      add_reference :dishes, :user, null: false, index: true
    end

    def down
      remove_reference :dishes, :user, index: true
    end
  end
end
