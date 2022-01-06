class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :body

      t.timestamps #This method defines two additional columns named created_at and updated_at
    end
  end
end
