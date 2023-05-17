class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :Title
      t.string :Body

      t.timestamps
    end
  end
end
