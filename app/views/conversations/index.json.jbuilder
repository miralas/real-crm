json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :first_owner_id, :second_owner_id, :account_id
  json.url conversation_url(conversation, format: :json)
end
