json.array!(@deals) do |deal|
  json.extract! deal, :id, :name, :status, :budget, :responsible, :notes, :task, :account_id
  json.url deal_url(deal, format: :json)
end
