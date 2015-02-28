class AddFieldsToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :distance, :integer
    add_column :professionals, :average_response_time, :integer
    add_column :professionals, :hourly_price, :integer
  end
end
