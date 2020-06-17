class PurchaseChannel < ApplicationRecord

    def self.search(search, status)
        key = "%#{search}%"
        if search
            where('purchaseChannel LIKE ? ', key)
        end
    end
end
