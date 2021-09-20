class AddWeeklyToHouseworks < ActiveRecord::Migration[5.2]
  def change
    add_column :houseworks, :monday, :boolean, default: false, null: false  
    add_column :houseworks, :tuesday, :boolean, default: false, null: false 
    add_column :houseworks, :wednesday, :boolean, default: false, null: false 
    add_column :houseworks, :thursday, :boolean, default: false, null: false
    add_column :houseworks, :friday, :boolean, default: false, null: false
    add_column :houseworks, :saturday, :boolean, default: false, null: false
    add_column :houseworks, :sunday, :boolean, default: false, null: false
  end
end

#チェックボックス用にカラムを追加する。
#defaultでfにすることで選択しなかったものはfとなる。どちらでもないといことは存在しないため。