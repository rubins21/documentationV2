#!/usr/bin/luajit

function changeMD2PDF(s)
    return s:gsub("%.md", ".pdf")
end

function removeExtra(s)
    return s:gsub(".*/", "")
end


local f = io.popen("find . |grep '\\.md'", "r")
for l in f:lines() do
        print ("file found: "..l)
	--io.popen('md-to-pdf '..l, "r")
	os.execute('md-to-pdf '..l)
	local f1 = io.open(l, "a")
	local l1 = changeMD2PDF(l)
	f1:write(string.format("\n"))
	f1:write(string.format("## Download \n"))
	print ("link ori: "..l1)
	local l2 = removeExtra(l1)
	print ("link after remove: ./"..l2)
	f1:write(string.format("[PDF](./"..l2..")"))
	f1:write(string.format("\n"))
end
f:close()
