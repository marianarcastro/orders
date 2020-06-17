class Order < ApplicationRecord

    def self.search(search)
        key = "%#{search}%"
        if search
            where('clientName LIKE ? OR reference LIKE ?', key, key)
        end
    end

    def self.findBatch(purchaseChannel)
        where('purchaseChannel LIKE ?', purchaseChannel)
    end

    def self.update(purchaseChannel)
        where('purchaseChannel LIKE ?', purchaseChannel).update_all('status = "production"')
    end

    def self.findPurchaseChannel(purchaseChannel)
        where('purchaseChannel LIKE ?', purchaseChannel)
    end

    def self.findStatus(status)
        @orders = Order.select(:reference).where('status LIKE ?', status)
    end
end
