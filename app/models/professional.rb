class Professional < ActiveRecord::Base
  include Nameable

  has_and_belongs_to_many :specialties
end
