class CreateMicrowaves < ActiveRecord::Migration[5.2]
  def change
    create_table :microwaves do |t|
      t.string :human_identifier
      t.string :status

      t.timestamps
    end
  end
end
