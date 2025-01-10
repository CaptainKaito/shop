class ChangeEmailAddressNullInUsers < ActiveRecord::Migration[8.0]
  def change
    # Cập nhật tất cả giá trị null thành một giá trị hợp lệ (ví dụ: một chuỗi trống)
    User.where(email_address: nil).update_all(email_address: 'default@example.com')

    # Sau đó, thay đổi cột email_address để không cho phép null
    change_column_null :users, :email_address, false
  end
end
