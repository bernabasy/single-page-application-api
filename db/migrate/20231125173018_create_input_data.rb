class CreateInputData < ActiveRecord::Migration[6.1]
  def change
    create_table :input_data do |t|
      t.string :name
      t.string :sectors, array: true, default: [], null: false # Modify this line
      t.boolean :agree_to_terms

      t.timestamps
    end
  end
end
