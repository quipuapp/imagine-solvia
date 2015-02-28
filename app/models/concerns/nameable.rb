module Nameable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name, :surnames
  end

  def complete_name
    [name, surnames].join(' ')
  end
end
