class RemoveSignInCountFromAdminUsers < ActiveRecord::Migration[5.2]
  
  def change
  	remove_column :admin_users, :sign_in_count
  end

end
