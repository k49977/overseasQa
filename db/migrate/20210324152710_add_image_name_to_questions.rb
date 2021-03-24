class AddImageNameToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions,:image_name,:string
  end
end
