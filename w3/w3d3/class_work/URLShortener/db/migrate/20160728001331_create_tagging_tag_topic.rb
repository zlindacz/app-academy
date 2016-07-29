class CreateTaggingTagTopic < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    create_table :tag_topics do |t|
      t.string :topic, null: false
      t.timestamps
    end

    add_index :taggings, :topic_id
  end
end
