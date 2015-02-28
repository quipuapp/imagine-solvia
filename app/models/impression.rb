class Impression < ActiveRecord::Base
  belongs_to :professional
  belongs_to :client

  validates_presence_of :professional, :client, :rating, :comment
  validates_inclusion_of :rating, in: 1..5
end
