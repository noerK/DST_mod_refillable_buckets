local Refiller = Class(function(self, inst)
    self.inst = inst
    self.refill_value = 50
end)

function Refiller:DoRefilling(target, doer)

    if target:HasTag("refillable") then
		print("worked somehow")
		-- local current_uses = inst.components.finiteuses:GetUses()
		target.components.finiteuses:SetUses(self.refill_value)

		if self.inst.components.finiteuses then
			self.inst.components.finiteuses:Use(1)
		elseif self.inst.components.stackable then
			self.inst.components.stackable:Get(1):Remove()
		end

		return true
	end

end

return Refiller