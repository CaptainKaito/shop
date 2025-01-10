class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    # Tạo bảng users nếu chưa tồn tại
    create_table :users, if_not_exists: true do |t|
      t.string :email_address, null: true
      t.string :password_digest, null: false

      t.timestamps
    end

    # Thêm cột email_address nếu nó chưa tồn tại
    unless column_exists?(:users, :email_address)
      add_column :users, :email_address, :string, null: true
    end

    # Thêm cột password_digest nếu nó chưa tồn tại
    unless column_exists?(:users, :password_digest)
      add_column :users, :password_digest, :string, null: false
    end

  
  end
end

