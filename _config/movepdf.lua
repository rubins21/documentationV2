#!/usr/bin/luajit

function removeMdExtensions(s)
    return s:gsub("%.md", "")
end


local f1 = io.popen("find . -not -path '*/.*' -type d", "r")
for l1 in f1:lines() do
        print ("dir found: "..l1)
        os.execute("mkdir -p ../build/pdf"..l1)
end


local f = io.popen("find . |grep '\\.pdf'", "r")
for l in f:lines() do
        print ("file found: "..l)
        --io.popen('md-to-pdf '..l, "r")
        os.execute("mv "..l.." ../build/pdf"..l)
end
f:close()
