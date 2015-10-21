class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, :post_id
    end
  end
end

=begin

class CreateComments < ActiveRecord::Migration
  def change
      t.text :body
      t.integer :user_id, :post_id
  end
end

def change
    create_table :comments do |t|
      t.text :body
    end
    add_column :comments, :post_id, :integer
    add_column :comments, :user_id, :integer
  end


=end

# if im creating the users and the posts tables and after I do rails db:migrate i remember that i did not add to my posts the FK,
# like chris says in the videos, that it is not correct to touch the migrations, instead of adding to the migrations 
# 't.integer :user_id' is it better to create a new table for example 'rails generate migration add_user_id_to_posts'?