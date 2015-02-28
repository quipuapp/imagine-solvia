class Professional < ActiveRecord::Base
  include Nameable

  has_and_belongs_to_many :specialties
  has_many :impressions

  scope :sort_by_rating, -> { order(arel_table[:rating].desc) }
  scope :sort_by_distance, -> { order(arel_table[:distance].asc) }
  scope :sort_by_best_price, -> { order(arel_table[:hourly_price].asc) }
  scope :sort_by_response_time, -> { order(arel_table[:average_response_time].asc) }

  def update_rating!
    self.rating = if impressions.any?
                    impressions.sum(:rating) / impressions.count.to_f
                  else
                    0
                  end
    save!
  end
end
