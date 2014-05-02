json.array!(@journals) do |journal|
  json.extract! journal, :id, :journal_date, :account_id, :journal_amount, :journal_entry_type, :journal_entry_description
  json.url journal_url(journal, format: :json)
end
