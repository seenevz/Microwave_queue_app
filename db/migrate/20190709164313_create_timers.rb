class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.time :start
      t.time :end
      t.references :line, foreign_key: true
      t.references :microwave, foreign_key: true

      t.timestamps
    end
  end
end
