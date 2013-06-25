class AddCounterToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :counter, :integer, :default => 1
  end
end
