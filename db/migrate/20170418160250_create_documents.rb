class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.string :author_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
