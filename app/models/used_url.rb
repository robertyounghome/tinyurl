class UsedUrl < ApplicationRecord
    self.primary_key = :short_name
    has_one :available_url, :foreign_key => :name, :primary_key => :short_name
    validates :long_name, presence: true
end
