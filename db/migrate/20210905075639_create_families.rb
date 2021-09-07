class CreateFamilies < ActiveRecord::Migration[5.2]
  #家族名、家族人数を入れたいため定義
  
  def change
    create_table :families do |t|
    t.string :family_name
    t.timestamps
  end
  
  #family model内にuser modelを入れているため下に定義
     cerate_table :users do |t|
       t.belongs_to :family
       t.timestamps
      end
  end
end
