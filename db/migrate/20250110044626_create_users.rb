class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    # Tạo bảng users nếu chưa tồn tại
    create_table :users, if_not_exists: true do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    # Thêm cột email_address nếu nó chưa tồn tại
    unless column_exists?(:users, :email_address)
      add_column :users, :email_address, :string, null: false
    end

    # Thêm cột password_digest nếu nó chưa tồn tại
    unless column_exists?(:users, :password_digest)
      add_column :users, :password_digest, :string, null: false
    end

    # Thêm index cho cột email_address nếu chưa có
    unless index_exists?(:users, :email_address)
      add_index :users, :email_address, unique: true
    end
  end
end

