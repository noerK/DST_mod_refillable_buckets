name = "!dev-Refillable Bucket"
description =   "You are now able to refill your Bucket-o-poop! \n\n" ..
                "You can refill it with every natural item that could also fertilize."
author = "noerK"
version = "1.0.1"

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

local function applySettings()
	Setting.title("Refiller Multiplicators:")
	Setting.add("refiller:multiplier_guano", "Guano", "%", "default is 100%", --[[default]]100 , --[[step]]10, --[[min]]0, --[[max]]300,--[[percentualize?]] true)
	Setting.add("refiller:multiplier_poop", "Poop", "%", "default is 100%", --[[default]]100 , --[[step]]10, --[[min]]0, --[[max]]300,--[[percentualize?]] true)
	Setting.add("refiller:multiplier_spoiled_food", "Spoiled Food", "%", "default is 100%", --[[default]]100 , --[[step]]10, --[[min]]0, --[[max]]300,--[[percentualize?]] true)
	Setting.add("refiller:multiplier_rotten_egg", "Rotten Egg", "%", "default is 100%", --[[default]]100 , --[[step]]10, --[[min]]0, --[[max]]300,--[[percentualize?]] true)
	Setting.add("refiller:multiplier_glommer_fuel", "Glommer Fuel", "%", "default is 100%", --[[default]]100 , --[[step]]10, --[[min]]0, --[[max]]300,--[[percentualize?]] true)

	Setting.title("Bucket:")
	Setting.add("uses:fertilizer", "Bucket-o-Poop uses", "", "default is 10",  --[[default]]10 , --[[step]]0, --[[min]]1, --[[max]]30)
end

-- ###################
-- Settings Functions
-- ###################

Setting = {}

Setting.add = function (name, label, valueType, hover, default, stepParam, minValue, maxValue, percentSetting)
	local new_options = {}
	local min = minValue or -200
	local max = maxValue or 200
	local type = valueType or ""
	local step = stepParam or 10


	local minInt = 0
	if min < 0 then
		minInt = -1 * (min / step)
	end

	local maxInt = max / step

	local percentualize = 1

	if percentSetting then
		percentualize = 100
	end

	local calculatedDefault = (default or 0) / percentualize

	for i = -1 * minInt, maxInt do
		new_options[i + minInt + 1] = {
			description = "" .. (i * step) .. type .. "",
			data = (i * step) / percentualize
		}
	end

	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = new_options,
		default = calculatedDefault,
		hover = hover or nil
	}
end

local boolean_options = {
	{
		description = "Yes",
		data = true
	},
	{
		description = "No",
		data = false
	},
}

Setting.boolean = function (name, label, default, hover)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = boolean_options,
		default = default or true,
		hover = hover or nil
	}
end

local alphabet = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
local key_options = {}
for i=1,#alphabet do
	key_options[i] = {description = alphabet[i], data = 96 + i}
end

Setting.keyBinding = function (name, label, default, hover)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = key_options,
		default = 110,
		hover = hover or nil
	}
end

Setting.title = function (title)
	return {
		name = title,
		options = {{description = "", data = 0}},
		default = 0,
	}
end

applySettings()