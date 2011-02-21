class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :hotel_id
      t.text :comment
      t.string :rating
      t.boolean :recommand
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
