json.array!(@companies) do |company|
  json.extract! company, :id, :name, :phone, :email, :site, :adress, :responsible, :account_id, :contact_id
  json.url company_url(company, format: :json)
end
