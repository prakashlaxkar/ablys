class UpdatesUsers < ActiveRecord::Migration
  def change
    User.where(is_ncc_member: true).update_all(is_ablys_member: true)
  end
end
