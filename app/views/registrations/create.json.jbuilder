json.user do
  json.full_name @user.full_name
  json.email @user.email
  json.auth_token @user.auth_token

end