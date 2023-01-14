#!/usr/bin/luajit

print("md file generator")

-----------------------------------------------------------------------------------

function string:split( inSplitPattern, outResults )

    if not outResults then
        outResults = { }
    end
    local theStart = 1
    local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
    while theSplitStart do
        table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
        theStart = theSplitEnd + 1
        theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
    end

    table.insert( outResults, string.sub( self, theStart ) )
    return outResults
end

function string:strip()
    return self:gsub("^%s*(.-)%s*$", "%1")
end

function table.count(t)

    local c = 0
    for a,b in pairs(t) do c = c + 1 end
	return c
end

-----------------------------------------------------------------------------------
-- mapping to nice names
local TitleMap = {}
TitleMap["network-config-cli"] 		= "Network Config (CLI)"
TitleMap["network-config-gui"] 		= "Network Config (GUI)"
TitleMap["scratch-disk-ext4"] 		= "Scratch Disk EXT4"
TitleMap["management-interface"] 	= "Management Interface"
TitleMap["capture-port-speed"] 		= "Capture Port Speed"
TitleMap["capture-port-ip-mac"] 	= "Capture Port Static IP"

setmetatable(TitleMap, { __index = function(t, k) return k end } )


local SidebarPos = {}
SidebarPos["Config"] = {}
SidebarPos["Config"]["network-config-gui"] 		= 100
SidebarPos["Config"]["network-config-cli"] 		= 101
SidebarPos["Config"]["management-interface"] 	= 102
SidebarPos["Config"]["capture-port-speed"] 		= 103
SidebarPos["Config"]["capture-port-ip-mac"] 	= 104

SidebarPos["Config"]["scratch-disk-ext4"] 		= 150

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

	-- header tags
	local SKUStr = SKU
	SKUStr = SKUStr:gsub("fmadio", "FMADIO") 

	write("<head>\n")	
	write("  <title> %s Doc | %s </title>\n", SKUStr, TitleMap[Name])	
	write("</head>\n")	

	write("\n")	
	write("\n")	

	local LineEnable = {} 

	for l in In:lines() do

		local o = l
		if (l:sub(1, 3) == "-- ") then

			-- dont include pre processor
			o = nil

			local cmd = l:sub(4, -1)
			local s = cmd:split("[%s]+")
			local sku  = s[1] 
			local verb = s[2] 
			print(sku, verb)


			if (verb == "begin") then
				LineEnable[sku] = true	
			end

			if (verb == "end") then
				LineEnable[sku] = nil 
			end


		-- not metacommand check if its valid
		else

			if (table.count(LineEnable) > 0) then
				
				if (LineEnable[SKU] == nil) then
					o = nil
				end
			end
		end

		if (o ~= nil) then
			Out:write(o.."\n")
		end
	end

	In:close()
	Out:close()
end

-----------------------------------------------------------------------------------

MasterGenerate("fmadio20v3", "../master/Config/network-configuration-gui.md", 		"Config", "network-config-gui")
MasterGenerate("fmadio20v3", "../master/Config/network-configuration-cli.md", 		"Config", "network-config-cli")
MasterGenerate("fmadio20v3", "../master/Config/scratch-disk-ext4.md", 				"Config", "scratch-disk-ext4")
MasterGenerate("fmadio20v3", "../master/Config/management-interface.md", 			"Config", "management-interface")
MasterGenerate("fmadio20v3", "../master/Config/capture-port-link-speed-f100.md",	"Config", "capture-port-speed")
MasterGenerate("fmadio20v3", "../master/Config/capture-port-ip-mac.md",				"Config", "capture-port-ip-mac")


MasterGenerate("fmadio20p3", "../master/Config/network-configuration-gui.md", 		"Config", "network-config-gui")
MasterGenerate("fmadio20p3", "../master/Config/network-configuration-cli.md", 		"Config", "network-config-cli")

MasterGenerate("fmadio40v3", "../master/Config/network-configuration-gui.md", 		"Config", "network-config-gui")
MasterGenerate("fmadio40v3", "../master/Config/network-configuration-cli.md", 		"Config", "network-config-cli")

MasterGenerate("fmadio100v2", "../master/Config/network-configuration-gui.md", 		"Config", "network-config-gui")
MasterGenerate("fmadio100v2", "../master/Config/network-configuration-cli.md", 		"Config", "network-config-cli")
MasterGenerate("fmadio100v2", "../master/Config/capture-port-link-speed-f100.md",	"Config", "capture-port-speed")

MasterGenerate("fmadio100p3", "../master/Config/network-configuration-gui.md", 		"Config", "network-config-gui")
MasterGenerate("fmadio100p3", "../master/Config/network-configuration-cli.md", 		"Config", "network-config-cli")

