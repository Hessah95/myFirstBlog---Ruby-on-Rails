class AddArticlesIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :article_id, :text
  end
end
