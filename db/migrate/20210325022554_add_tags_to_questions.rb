class AddTagsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :tags, :string
  end
end
