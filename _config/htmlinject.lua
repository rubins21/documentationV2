#!/usr/bin/luajit

os.execute("cp index.bak index.html")

local f = io.popen("find . |grep index.html", "r")
for l in f:lines() do
        print ("file found: "..l)
        local h = 0
        print ("init h: "..h)
        local h = io.popen("cat -n "..l.." |grep '</head>'|grep -E -o '[0-9]+'", "r")
        local hlist = h:read("*line")
        h:close()
        print ("line head: "..hlist)
        h1 = tonumber(hlist) - 1
        print ("line to insert: "..h1)
        os.execute("sed -i -e '"..h1.." r ins.txt'  "..l)
end
f:close()
