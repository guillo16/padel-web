class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.date :date
      t.string :photo

      t.timestamps
    end
  end
end
