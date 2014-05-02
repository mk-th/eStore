json.array!(@accounts) do |account|
  json.extract! account, :id, :account_name, :account_number, :account_email, :account_details
  json.url account_url(account, format: :json)
end
