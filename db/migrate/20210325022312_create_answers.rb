class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :user_id
      t.integer :question_id
      t.string :image_name

      t.timestamps
    end
  end
end
