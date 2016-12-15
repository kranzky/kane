class HashSerializer
  def self.dump(hash)
    hash.to_json
  end

  def self.load(hash)
    return nil if hash.nil?
    hash = JSON.parse(hash) if hash.is_a?(String)
    hash.with_indifferent_access
  end
end
