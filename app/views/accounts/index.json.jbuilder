json.array!(@accounts) do |account|
  json.extract! account, :id, :owner_id, :deeals, :contacts
  json.url account_url(account, format: :json)
end
