class CreateBlogposts < ActiveRecord::Migration
    def change
    create_table :blogposts do |t|
      t.string :title
      t.string :content
      t.string :filesrc
      t.string :hreflink
        end
    end

end
