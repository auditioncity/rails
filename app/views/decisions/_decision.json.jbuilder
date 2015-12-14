json.decision do
  actor = decision.actor
  director = decision.director
  json.id decision.id
  json.notes decision.notes
  json.callback decision.callback
  json.actor do
    json.id actor.id
    json.full_name actor.user.full_name
  end
  json.director do
    json.id director.id
    json.full_name director.user.full_name
  end
end