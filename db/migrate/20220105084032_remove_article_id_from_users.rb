class RemoveArticleIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :article_id, :text
  end
end
