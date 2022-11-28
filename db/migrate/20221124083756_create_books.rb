class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.column :author, :string
      t.column :title, :string
      t.column :synposis, :text
      t.timestamps
    end
  end
end
