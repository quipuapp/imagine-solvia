class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions
    add_column :impressions, :professional_id, :integer
    add_column :impressions, :client_id, :integer
    add_column :impressions, :rating, :integer
    add_column :impressions, :comment, :string
  end
end
