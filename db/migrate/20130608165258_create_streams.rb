class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name
      t.datetime :last_used

      t.timestamps
    end
  end
end
