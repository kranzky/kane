class Statistic < ApplicationRecord
  belongs_to :user, inverse_of: :statistics, counter_cache: true
  belongs_to :post, inverse_of: :statistics, counter_cache: true

  enum state: {
    none: 'none',
    saved: 'saved',
    deleted: 'deleted'
  }, _prefix: true

  validates :seen_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :view_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :view_seconds, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :view_percent, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def read?
    self.view_seconds >= 10 && self.view_percent >= 30
  end
end
