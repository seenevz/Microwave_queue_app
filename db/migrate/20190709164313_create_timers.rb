class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.string :duration
      t.references :user, foreign_key: true
      t.references :microwave, foreign_key: true

      t.timestamps
    end
  end
end
