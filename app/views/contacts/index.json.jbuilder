json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone, :email, :skype, :post, :responsible, :account_id, :company_id, :notes
  json.url contact_url(contact, format: :json)
end
