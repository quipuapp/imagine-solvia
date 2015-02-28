class CreateProfessionalsSpecialties < ActiveRecord::Migration
  def change
    # Specialties
    create_table :specialties
    add_column :specialties, :name, :string

    # Professional specialties
    create_table :professionals_specialties
    add_column :professionals_specialties, :professional_id, :string
    add_index :professionals_specialties, :professional_id
    add_column :professionals_specialties, :specialty_id, :string
    add_index :professionals_specialties, :specialty_id
  end
end
