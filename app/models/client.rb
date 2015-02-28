class Client < ActiveRecord::Base
  include Nameable

  has_many :impressions
end
