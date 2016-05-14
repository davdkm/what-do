class CreateJoinTableEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|
      t.integer :event_id
      t.integer :tag_id
    end
  end
end
