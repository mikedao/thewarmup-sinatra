class CreateProblemsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.text :text
      t.timestamps
    end
  end
end
