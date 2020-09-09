class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                             null: false, default: ""
      t.string :content,                            null: false, default: ""
      t.string :image,                             null: false, default: ""
      t.string :category,                          null: false, default: ""
      t.string :status,                            null: false, default: ""
      t.string :burden,                            null: false, default: ""
      t.string :area,                              null: false, default: ""
      t.string :days,                              null: false, default: ""
      t.string :price,                             null: false, default: ""
      t.string :tax,                               null: false, default: ""
      t.string :benefit,                           null: false, default: ""
      t.timestamps
    end
  end
end
