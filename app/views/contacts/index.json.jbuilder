json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :email_address
  json.url contact_url(contact, format: :json)
end
