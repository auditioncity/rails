json.user do
  json.extract! @user, :email, :auth_token
  actor_id = Actor.find_by_user_id(@user.id)
  json.actor_id actor_id.id if actor_id
  json.director_id @user.director.id if @user.director
end