class AddCreatorToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :creator_id, :integer
  end
end
