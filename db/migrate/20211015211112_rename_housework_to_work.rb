class RenameHouseworkToWork < ActiveRecord::Migration[6.0]
  def change
    #家事モデルをhouseworkからworkへ変更
    rename_table :houseworks, :works 
  end
end
