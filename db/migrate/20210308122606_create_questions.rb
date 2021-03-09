class CreateQuestions < ActiveRecord::Migration[6.1]

  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :user_id , null: false
      t.timestamps
    end
  end
end
