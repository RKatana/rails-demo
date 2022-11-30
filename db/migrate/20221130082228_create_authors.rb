class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.timestamps
    end
  end
end
