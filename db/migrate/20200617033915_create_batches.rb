class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.string :reference
      t.string :purchaseChannel
      t.string :orders, Array

      t.timestamps
    end
  end
end
