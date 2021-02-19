class AddMemberIdsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :member_ids, :string
  end
end
