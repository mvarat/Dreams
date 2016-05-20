class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string    :topic,        null: false
      t.string    :description,  null: false
      t.boolean   :code,         default: false
      t.string    :creator,      null: false
      
      t.timestamps null: false
    end
  end
end
