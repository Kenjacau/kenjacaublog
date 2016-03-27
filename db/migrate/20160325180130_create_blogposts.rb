class CreateBlogposts < ActiveRecord::Migration
    def change
    create_table :blogposts do |t|
      t.text :title
      t.text :content
      t.string :filesrc
      t.string :hreflink
    end
   end

end
