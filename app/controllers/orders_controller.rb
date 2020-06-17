class OrdersController < ApplicationController
    before_action :find_order, only: [:show]
    
    def index
        @orders = Order.search(params[:search])
        @ordersAll = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
        @purchaseChannel = PurchaseChannel.new
    end

    def create
        randNumber = (rand 1000..10000)
        reference = "BR" + randNumber.to_s
        status = "ready"
        @order = Order.new(reference: reference, 
                           purchaseChannel: order_params[:purchaseChannel],
                           clientName: order_params[:clientName],
                           adress: order_params[:adress],
                           deliveryService: order_params[:deliveryService],
                           totalValue: order_params[:totalValue],
                           lineItems: order_params[:lineItems],
                           status: status)
        @purchaseChannel = PurchaseChannel.new(purchaseChannel: order_params[:purchaseChannel],
                                               orders: @order)  
        @purchaseChannel.save                
        if @order.save
            redirect_to @order
        else
            render 'new'
        end
         
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def find_order
            @order = Order.find(params[:id])
        end

        def order_params
            params.require(:order).permit(:purchaseChannel, :clientName, :adress, :deliveryService, 
            :totalValue, :lineItems)
        end
end
