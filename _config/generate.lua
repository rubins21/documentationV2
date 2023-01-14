#!/usr/bin/luajit

print("md file generator")

-----------------------------------------------------------------------------------
-- mapping to nice names
local TitleMap = {}
TitleMap["network-config-cli"] = "Network Config (CLI)"
TitleMap["network-config-gui"] = "Network Config (GUI)"

setmetatable(TitleMap, { __index = function(t, k) return k end } )


local SidebarPos = {}
SidebarPos["Config"] = {}
SidebarPos["Config"]["network-config-gui"] = 100
SidebarPos["Config"]["network-config-cli"] = 101

SidebarPos["Settings"] 				= {} 
SidebarPos["Settings"]["capture"] 	= 200

SidebarPos["Troubleshooting"] 		= 300

SidebarPos["Maintenance"] 			= 400

-----------------------------------------------------------------------------------
local MasterGenerate = function(SKU, Source, Section, Name)

	local OutputName = "../"..SKU.."/"..Section.."/"..Name..".md"
	print(OutputName)

	local Out = io.open(OutputName, "w")
	assert(Out ~= nil)

	local In = io.open(Source, "r") 
	assert(In ~= nil)

	function write(Message, ...)
		Out:write( string.format(Message, unpack({...})))
	end

	write("---\n")
	write("title: '%s'\n", TitleMap[Name])
	write("sidebar_label: '%s'\n", TitleMap[Name])

	local Sec = SidebarPos[Section]
	local Pos = tonumber(Sec)
	if (type(Sec) == "table") then
		Pos = SidebarPos[Section][Name]
	end
	if (Pos ~= nil) then
		write("sidebar_position: %i\n", Pos)
	end
	write("---\n")
print(Section, Name, Pos)

	-- header tags
	local SKUStr = SKU
	SKUStr = SKUStr:gsub("fmadio", "FMADIO") 

	write("<head>\n")	
	write("  <title> %s Docs | %s </title>\n", SKUStr, TitleMap[Name])	
	write("</head>\n")	

	write("\n")	
	write("\n")	

	for l in In:lines() do
		Out:write(l.."\n")
	end

	In:close()
	Out:close()
end

-----------------------------------------------------------------------------------

MasterGenerate("fmadio20v3", "../master/Config/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio20v3", "../master/Config/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio20p3", "../master/Config/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio20p3", "../master/Config/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio40v3", "../master/Config/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio40v3", "../master/Config/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio100v2", "../master/Config/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio100v2", "../master/Config/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio100p3", "../master/Config/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio100p3", "../master/Config/network-configuration-cli.md", "Config", "network-config-cli")
