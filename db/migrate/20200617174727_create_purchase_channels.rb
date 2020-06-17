class CreatePurchaseChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_channels do |t|
      t.string :purchaseChannel
      t.string :orders, Array
      t.timestamps
    end
  end
end
