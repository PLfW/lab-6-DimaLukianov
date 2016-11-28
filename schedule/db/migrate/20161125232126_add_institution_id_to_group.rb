class AddInstitutionIdToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :institution_id, :integer
  end
end
