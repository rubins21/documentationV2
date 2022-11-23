#!/usr/bin/luajit

--os.execute("cp index.bak index.html")

local f = io.popen("find . |grep '\\.md'", "r")
for l in f:lines() do
        print ("file found: "..l)
	--io.popen('md-to-pdf '..l, "r")
	os.execute('md-to-pdf '..l)
end
f:close()
