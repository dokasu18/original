class RenameContentTextColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :content_text, :comment_text
  end
end
