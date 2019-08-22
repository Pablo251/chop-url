class Site < ApplicationRecord
    validates_presence_of :full_url

    # Increases the assessed attempts
    def rate_site
        self.accessed_attempts += 1
        self.save
    end
end
