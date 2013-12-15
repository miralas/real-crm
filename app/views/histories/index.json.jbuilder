json.array!(@histories) do |history|
  json.extract! history, :id, :account_id, :user_id, :action, :obj_name, :obj_link
  json.url history_url(history, format: :json)
end
