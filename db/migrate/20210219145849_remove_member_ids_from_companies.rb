class RemoveMemberIdsFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :member_ids, :string
  end
end
