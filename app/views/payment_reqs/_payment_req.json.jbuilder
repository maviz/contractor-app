json.extract! payment_req, :id, :amount, :currency, :description, :created_at, :updated_at
json.url payment_req_url(payment_req, format: :json)
