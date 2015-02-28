class Specialty < ActiveRecord::Base
  has_and_belongs_to_many :professionals

  scope :beginning_with, ->(term) { where(arel_table[:name].matches("#{term}%")) }
end
