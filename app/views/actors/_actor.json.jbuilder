json.actor do
  json.id actor.id
  json.full_name actor.user.full_name
  json.bio actor.bio
  json.age_young actor.age_young
  json.age_old actor.age_old
  json.height_feet actor.height_feet
  json.height_inches actor.height_inches
  json.hair_color actor.hair_color
  json.eye_color actor.eye_color
  json.skills actor.skills
  json.gender actor.gender
  json.ethnicity actor.ethnicity
  json.talent_agency actor.talent_agency
  json.union actor.union
  json.headshot_full actor.headshot.url(:full)
  json.headshot_large actor.headshot.url(:large)
  json.headshot_mobile actor.headshot.url(:mobile)
  json.headshot_small actor.headshot.url(:small)
  json.headshot_thumb actor.headshot.url(:thumb)
  json.resume actor.resume.url
  json.addresses actor.addresses do |address|
    json.type address.label
    json.address1 address.address1
    json.address2 address.address2
    json.city address.city
    json.state address.state
    json.zip address.zip
  end
  json.emails actor.emails do |email|
    json.type email.label
    json.email email.info
  end
  json.phones actor.phone_numbers do |phone|
    json.type phone.label
    json.phone phone.info
  end
  json.urls actor.websites do |url|
    json.type url.label
    json.url url.info
  end
  #binding.pry
  if @user.director
    decision = @user.director.decisions.find_by_actor_id(actor.id)
    json.decision_notes decision.notes if decision
    json.decision_callback decision.callback if decision
  end
end
