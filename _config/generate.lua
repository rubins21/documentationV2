#!/usr/bin/luajit

print("md file generator")


-----------------------------------------------------------------------------------
local MasterGenerate = function(SKU, Source, Section, Name)

	local OutputName = "../"..SKU.."/"..Section.."/"..Name..".md"
	print(OutputName)

	local Out = io.open(OutputName, "w")
	assert(Out ~= nil)

	local In = io.open(Source, "r") 
	assert(In ~= nil)

	for l in In:lines() do
		Out:write(l.."\n")
	end

	In:close()
	Out:close()

end

-----------------------------------------------------------------------------------


MasterGenerate("fmadio20v3", "../master/configuration/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio20v3", "../master/configuration/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio20p3", "../master/configuration/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio20p3", "../master/configuration/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio40v3", "../master/configuration/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio40v3", "../master/configuration/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio100v2", "../master/configuration/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio100v2", "../master/configuration/network-configuration-cli.md", "Config", "network-config-cli")

MasterGenerate("fmadio100p3", "../master/configuration/network-configuration-gui.md", "Config", "network-config-gui")
MasterGenerate("fmadio100p3", "../master/configuration/network-configuration-cli.md", "Config", "network-config-cli")
