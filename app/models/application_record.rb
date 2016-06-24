class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random(count=1)
    query = self.limit(count).order("RANDOM()")
    count == 1 ? query.first : query.to_a
  end
end
