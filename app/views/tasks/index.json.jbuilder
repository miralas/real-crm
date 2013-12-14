json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :type, :description, :date, :responsible, :account_id, :contact_id, :company_id, :deal_id
  json.url task_url(task, format: :json)
end
