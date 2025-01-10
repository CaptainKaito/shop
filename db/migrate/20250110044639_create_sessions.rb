class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    # Tạo bảng nếu chưa tồn tại
    create_table :sessions, if_not_exists: true do |t|
      t.references :user, null: false, foreign_key: false
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end

    # Nếu bảng sessions đã tồn tại, thêm cột (nếu chưa có)
    unless column_exists?(:sessions, :ip_address)
      add_column :sessions, :ip_address, :string
    end

    unless column_exists?(:sessions, :user_agent)
      add_column :sessions, :user_agent, :string
    end
  end
end
