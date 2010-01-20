class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :name
      t.string    :email
      t.integer   :age
      t.string    :phone
    end
    add_index :users, :email, :unique => true
    add_index :users, :name
    add_index :users, :age
    add_index :users, [:email, :name], :unique => true
  end

  def self.down
    drop_table :users
  end
end
