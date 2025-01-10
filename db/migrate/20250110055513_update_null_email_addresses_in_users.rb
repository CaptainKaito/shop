class UpdateNullEmailAddressesInUsers < ActiveRecord::Migration[8.0]
  def change
    # Cập nhật tất cả giá trị null trong email_address thành một giá trị mặc định
    User.where(email_address: nil).update_all(email_address: 'default@example.com')
  end
end
