class AddRatingToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :rating, :decimal
  end
end
