do
function run(msg, matches)
  if matches[1] == 'userid' then
return "🔄Your id : "..msg.from.id.."\n━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━\n🔀Group id∶"..msg.to.id..""
end
  if matches[1] == 'gpid' then
return "🔀Group id : "..msg.to.id..""  
end
  if matches[1] == 'phone' then
return "🔁Your phoneNumber : +"..(msg.from.phone or '404 \nI dont have your number')..""
end
end
return {
  usage = {
    '!userid : user id',
    '!gpid : group id',
    '!phone : phone number'
  },
  patterns = {
    "^[!#/](.*)$",
  },
  run = run
}
end
