class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string     :title,       null: false
      t.text       :advice_text, null: false
      t.integer    :hour_id,     null: false
      t.text       :food_first,  null: false
      t.text       :food_second
      t.text       :spice,       null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
