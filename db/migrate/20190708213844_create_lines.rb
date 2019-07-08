class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.references :User, foreign_key: true
      t.references :Microwave, foreign_key: true

      t.timestamps
    end
  end
end
