class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.text       :step_text,   null: false
      t.integer    :step_number, null: false
      t.references :menu,        null: false, foreign_key: true 
      t.timestamps
    end
  end
end
