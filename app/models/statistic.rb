class Statistic < ApplicationRecord
  belongs_to :user, inverse_of: :statistics, counter_cache: true
  belongs_to :post, inverse_of: :statistics, counter_cache: true

  enum state: {
    none: 'none',
    saved: 'saved',
    deleted: 'deleted'
  }, _prefix: true

  validates :seen_count
  validates :view_count
  validates :view_seconds
  validates :view_percent

  def read?
    self.view_seconds >= 10 && self.view_percent >= 30
  end
end
