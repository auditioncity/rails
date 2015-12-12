json.director do
  json.id director.id
  json.full_name director.user.full_name
  json.company_name director.company_name
  json.addresses director.addresses do |address|
    json.type address.label
    json.address1 address.address1
    json.address2 address.address2
    json.city address.city
    json.state address.state
    json.zip address.zip
  end
  json.emails director.emails do |email|
    json.type email.label
    json.email email.info
  end
  json.phones director.phone_numbers do |phone|
    json.type phone.label
    json.phone phone.info
  end
  json.urls director.websites do |url|
    json.type url.label
    json.url url.info
  end
end