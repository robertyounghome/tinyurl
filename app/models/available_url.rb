class AvailableUrl < ApplicationRecord
    self.primary_key = :name
    has_one :used_url, :foreign_key => :short_name, :primary_key => :name
end
