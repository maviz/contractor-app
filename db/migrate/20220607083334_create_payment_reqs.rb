class CreatePaymentReqs < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_reqs do |t|
      t.integer :amount
      t.string :currency
      t.text :description
      t.integer :status
      t.timestamps
    end
  end
end
