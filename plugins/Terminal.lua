function run(msg, matches) 
  if is_sudo(msg) then
textt = io.popen("" .. matches[1]):read('*all')
text= textt .."\n〰〰〰〰〰〰〰〰〰〰〰\n🔄Electrovirus selfbot™"
       if (textt=="") then
       text="📍There was an error⚠️"
      end
  if matches[1] == 'sleep' then
textt = io.popen("sleep " ..matches[2]):read('*all')
    text= textt .."\n💤It was a good sleep😴\nI slept for "..matches[2].." seconds"
    end
  return text                                                                                                                        
end  
 end
return {                                                                                                                             
  patterns = {
  '^[Rr]oot@[Ee]lectrovirus:~$ (sleep) (.*)$',
    '^[Rr]oot@[Ee]lectrovirus:~$ (.*)$',
  '^[Uu]ser@RootServer:~$ (sleep) (.*)$',
    '^[Uu]ser@RootServer:~$ (.*)$',
   '^[#]root (.*)$'
  },                                                                                                                                 
  run = run,                                                                                                                         
  moderated = true                                                                                                                   
}
