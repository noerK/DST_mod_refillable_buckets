local REFILL = AddAction("REFILL", "Refill Bucket", function(act)
    if act.target ~= nil and
        act.invobject ~= nil and
        act.target.components.finiteuses ~= nil and
        act.invobject.components.refiller ~= nil then

        return act.invobject.components.refiller:DoRefilling(act.target, act.doer)
    end
end)

GLOBAL.STRINGS.ACTIONS.REFILL = { REFILL = "Refill Bucket", REFILLED = "Already full of shit" }
REFILL.strfn = function(act)
	return act.target and (act.target:HasTag("refillable") and "REFILL" or "REFILLED")
end
REFILL.mount_valid = true

AddComponentAction("USEITEM", "refiller", function(inst, doer, target, actions)
  if target:HasTag("refillable") and
      not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding() and
          not (target.replica.inventoryitem ~= nil and target.replica.inventoryitem:IsGrandOwner(doer))) then
      table.insert(actions, REFILL)
  end
end)

if not GLOBAL.TheNet:GetIsServer() then return end

AddPrefabPostInit("fertilizer", function(inst)
  inst.components.finiteuses:SetOnFinished(function(inst)
      inst:RemoveComponent("fertilizer")
      inst:RemoveTag("refilled")
      inst:AddTag("refillable")
  end)
  if inst.components.finiteuses:GetUses() == 0 then
      inst:AddTag("refillable")
  end
end)

AddPrefabPostInit("poop", function(inst)
  inst:AddComponent("refiller")
end)