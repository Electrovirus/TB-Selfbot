 local function run(msg, matches) 
if matches[1] == "setsecpm" then 
if not is_sudo(msg) then 
return 'You are not sudo' 
end 
local pm = matches[2] 
redis:set('bot:pm',pm) 
return 'Secretary text set' 
end 

if matches[1] == "secpm" and is_sudo(msg) then
local hash = ('bot:pm') 
    local pm = redis:get(hash) 
    if not pm then 
    return ' Not set ' 
    else 
    reply_msg(msg.id, 'Secretary text:\n\n'..pm, ok_cb, false)
    end
end

if matches[1]=="secretary" then 
if not is_sudo(msg) then 
return 'You are not sudo' 
end 
if matches[2]=="on"then 
redis:set("bot:pm", "no pm")
return "Secretary activated" 
end 
if matches[2]=="off"then 
redis:del("bot:pm")
return "Secretary inActivated" 
end
 end

  if msg.to.type == "user" and not is_sudo(msg) and msg.text then
    local hash = ('bot:pm') 
    local pm = redis:get(hash)
if msg.from.id == 184018132 or msg.to.type == 'channel' or msg.to.type == 'chat' then
return
else
    reply_msg(msg.id, pm, ok_cb, false)
    end 
    end
end
return { 
patterns ={ 
"^[!#/](setsecpm) (.*)$", 
"^[!#/](secretary) (on)$", 
"^[!#/](secretary) (off)$", 
"^[!#/](secpm)$", 
"^(.*)$", 
}, 
run = run 
}
