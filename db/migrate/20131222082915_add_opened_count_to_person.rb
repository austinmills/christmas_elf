class AddOpenedCountToPerson < ActiveRecord::Migration
  def change
    add_column :people, :opened, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE people
            SET opened = 0
        SQL
      end
      dir.down do
      end
    end
  end

end
