class CreateComments < ActiveRecord::Migration
def change
    create_table :comments do |t|
      t.string :user, :default => "anon"
      t.text :comment
    end
    add_reference :comments, :blogposts
end
end
