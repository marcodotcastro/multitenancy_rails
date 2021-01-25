class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    default: { writing: :primary, reading: :primary },
    marco: { writing: :primary_marco, reading: :primary_marco }
  }
end
