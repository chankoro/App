class CreateFamilies < ActiveRecord::Migration[5.2]
  #家族名、家族人数を入れたいため定義
  
  def change
    create_table :families do |t|
    t.string :name
    t.timestamps
  end
  
  end
end
