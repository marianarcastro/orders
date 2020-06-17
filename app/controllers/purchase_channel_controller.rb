class PurchaseChannelController < ApplicationController
    
    def index
        if(params[:search])
            
            @purchaseChannel = PurchaseChannel.search(params[:search], params[:status])
        end
    end

    def show
        @purchaseChannel = PurchaseChannel.find(params[:id])
        @orders = Order.findPurchaseChannel(@purchaseChannel.purchaseChannel)
    end
end
