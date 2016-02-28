local function split(inputstr)
    local sep="%s"
    local t={}
    local parsed = {}
    local i=1
    for str in string.gmatch(inputstr,"([^"..sep.."]+)") do
        t[i]=str
        if t[i]:find("telegram.me/joinchat/")then
            parsed[i]=t[i]
            import_chat_link(t[i],ok_cb,false)
        end
        i=i+1
    end
    return parsed
end

local function enter_parsed(vett)
    local i=1
    local res=false
    for k,v in pairs(vett) do
        --import_chat_link(v[i],ok_cb,false)
        print(i.." - "..v)
        i=i+1
        res=true
    end
    return res
end

local function print_grabbed_link(msg,text)
    local chan = "channel#id"..1028028426
    if not msg then
        return
    end
    post_msg(chan,text,ok_cb,false)
end

local function elab_file()
    local all = {}
    local hash = {}
    local fixed = {}
    local text = ""
    local file=io.open("./grabbedlinks.txt","r")
    local i = 1
    for line in file:lines() do
        table.insert(all,line)
    end
    file:close()
    for _,v in ipairs(all) do
        if not hash[v] then
            fixed[#fixed+1]=v
            hash[v]=true
        end
    end
    file=io.open("./grabbedlinks.txt","w")
    for _,k in ipairs(fixed) do
        text=text..k.."\n"
    end
    file:write(text)
    file:flush()
    file:close()
end

local function print_to_file(msg,array)
    local file = io.open("./grabbedlinks.txt","a")
    local text=""
    if not file then
        return "errore apertura file"
    end
    for k,v in pairs(array) do
        text = text..v.."\n"
    end
    file:write(text)
    file:flush()
    file:close()
end

local function run(msg,matches)
    local parsed = split(matches[1])
    local res = enter_parsed(parsed)
    print(msg.to.id)
    if res then
        print_grabbed_link(msg,matches[1])
        print_to_file(msg,parsed)
    end
    --elab_file()
end

return {
    patterns = {
        "(.*)"
    },
    run=run,
}
