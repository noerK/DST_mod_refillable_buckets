name = "Refillable Bucket"
description =   "You are now able to refill your Bucket-o-poop! \n\n" ..
                "You can refill it with every natural item that could also fertilize."
author = "noerK"
version = "1.0.0"

forumthread = ""

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = true
all_clients_require_mod = true
client_only_mod = false

api_version = 10

icon_atlas = "preview.xml"
icon = "preview.tex"

server_filter_tags = {"bucket poop refill"}

priority = 1


--[[
[h1]You are now able to refill your Bucket-o-poop![/h1]

You can refill it with every natural item that could also fertilize.
The numbers behind are the default uses restored by each item (same relation as their fertilization values):
- Guano (7.5)
- Poop/Manure (5)
- Rot/Spoiled Food (1.25)
- Rotten Eggs (1.25)
- Glommer's Goop (5)

Everything is adjustable - you can also increase the number of maximum uses.

Happy fertilizing :)
]]

configuration_options = {}

local multiplicator_options = {}
for i=0,30 do
	multiplicator_options[i+1] = {
		description = "" .. (i*10) .. "%",
		data = ((i*10)/100)
	}
end
local function addMultiplicatorSetting(name, label, default, hover)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = multiplicator_options,
		default = default or 1,
		hover = hover or nil
	}
end

local static_options = {}
for i=0,20 do
	static_options[i+1] = {
		description = "" .. (i*5) .. "",
		data = (i*5)
	}
end
local function addStaticSetting(name, label, default, hover)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = static_options,
		default = default or 0,
		hover = hover or nil
	}
end

addMultiplicatorSetting("refiller:multiplier_guano", "Guano")
addMultiplicatorSetting("refiller:multiplier_poop", "Poop/Manure")
addMultiplicatorSetting("refiller:multiplier_spoiled_food", "Rot/Spoiled Food")
addMultiplicatorSetting("refiller:multiplier_rotten_egg", "Rotten Egg")
addMultiplicatorSetting("refiller:multiplier_glommer_fuel", "Glommer's Goop")
addStaticSetting("uses:fertilizer", "Bucket-o-Poop uses", 10)