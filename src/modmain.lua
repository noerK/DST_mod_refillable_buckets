local multiplier_guano = GetModConfigData("refiller:multiplier_guano")
local multiplier_poop = GetModConfigData("refiller:multiplier_poop")
local multiplier_spoiled_food = GetModConfigData("refiller:multiplier_spoiled_food")
local multiplier_rotten_egg = GetModConfigData("refiller:multiplier_rotten_egg")
local multiplier_glommer_fuel = GetModConfigData("refiller:multiplier_glommer_fuel")

if GetModConfigData("uses:fertilizer") ~= 10 then
    TUNING.FERTILIZER_USES = GetModConfigData("uses:fertilizer")
end

local REFILL = AddAction("REFILL", "Refill Bucket", function(act)
    if act.target ~= nil and
        act.invobject ~= nil and
        act.target.components.finiteuses ~= nil and
        act.invobject.components.refiller ~= nil then
        return act.invobject.components.refiller:DoRefilling(act.target, act.doer)
    end
end)

REFILL.strfn = function(act)
	return act.target and (act.target:HasTag("refillable") and "Refill Bucket")
end
REFILL.mount_valid = true

AddComponentAction("USEITEM", "refiller", function(inst, doer, target, actions)
    if target:HasTag("refillable") and
        not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding() and
        not (target.replica.inventoryitem ~= nil and target.replica.inventoryitem:IsGrandOwner(doer))) then
            table.insert(actions, REFILL)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(REFILL, "give"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(REFILL, "give"))

if not GLOBAL.TheNet:GetIsServer() then return end

local function checkRefillableState(inst)
    if inst.components.finiteuses:GetUses() < inst.components.finiteuses.total then
        inst:AddTag("refillable")
    else
        inst:RemoveTag("refillable")
    end
end

AddPrefabPostInit("fertilizer", function(inst)
    inst.components.finiteuses:SetOnFinished(function(inst)
        inst:RemoveComponent("fertilizer")
        inst:AddTag("refillable")
    end)
    checkRefillableState(inst)
    inst:ListenForEvent("percentusedchange", function(inst)
        checkRefillableState(inst)
    end)
end)

AddPrefabPostInit("poop", function(inst)
    if multiplier_poop > 0 then
        inst:AddComponent("refiller")
        inst.components.refiller.refill_value = 5 * multiplier_poop
    end
end)

AddPrefabPostInit("guano", function(inst)
    if multiplier_guano > 0 then
        inst:AddComponent("refiller")
        inst.components.refiller.refill_value = 7.5 * multiplier_guano
    end
end)

AddPrefabPostInit("spoiled_food", function(inst)
    if multiplier_spoiled_food > 0 then
        inst:AddComponent("refiller")
        inst.components.refiller.refill_value = 1.25 * multiplier_spoiled_food
    end
end)

AddPrefabPostInit("rottenegg", function(inst)
    if multiplier_rotten_egg > 0 then
        inst:AddComponent("refiller")
        inst.components.refiller.refill_value = 1.25 * multiplier_rotten_egg
    end
end)

AddPrefabPostInit("glommerfuel", function(inst)
    if multiplier_glommer_fuel then
        inst:AddComponent("refiller")
        inst.components.refiller.refill_value = 5 * multiplier_glommer_fuel
    end
end)


