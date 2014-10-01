class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text     "title"
      t.text     "body"
    end
  end
end
