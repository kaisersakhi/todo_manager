class CreateTodo < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :todo_text
      t.text :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
