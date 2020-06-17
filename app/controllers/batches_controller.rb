class BatchesController < ApplicationController
    before_action :find_batch, only: [:show]

    def index
        @batches = Batch.all
    end

    def show
        @orders = Order.findBatch(@batch.purchaseChannel)
    end
    
    def new 
        @batch = Batch.new
    end

    def create
        randNumber = (rand 1000..10000)
        reference = "BR" + randNumber.to_s
        orders = Order.findBatch(batch_params[:purchaseChannel])
        Order.update(batch_params[:purchaseChannel])
        @batch = Batch.new(reference: reference,
                           purchaseChannel: batch_params[:purchaseChannel],
                           orders: orders)
        if @batch.save
            redirect_to @batch
        else
            render 'new'
        end
    end

    private
        def find_batch
            @batch = Batch.find(params[:id])
        end

        def batch_params
            params.require(:batch).permit(:purchaseChannel)
        end

end
