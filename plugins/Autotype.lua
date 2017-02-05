function type(msg, matches)
local receiver = get_receiver(msg)
local hash = 'typing:'..receiver
     if matches[1] == 'typing' and is_sudo(msg) then
--Enable Typing
     if matches[2] == 'active' then
    redis:del(hash)
   return 'Typing has been activated'
--Disable Typing
     elseif matches[2] == 'inactive' then
    redis:set(hash, true)
   return 'Typing has been inactivated'
--Typing Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Typing is Active🔄'
       else
   return 'Typing is inActive🔄'
         end
      end
   end
      if not redis:get(hash) then
send_typing(get_receiver(msg), ok_cb, false)
   end
end
return { 
patterns = {
"^[!/#](typing) (.*)$",
"(.*)",
},
run = type
}
