class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[5.2]
  
  def change
  	rename_column :admin_users, :encrypted_password, :password_digest
  end

end
