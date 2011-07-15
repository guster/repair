local f = CreateFrame("Frame")
f:SetScript("OnEvent", function ()
  local cost, canRepair = GetRepairAllCost()
  
  if canRepair then
    local canGuildRepair = CanGuildBankRepair()
    
    if canGuildRepair and cost > GetGuildBankWithdrawMoney() then
      canGuildRepair = nil
    end
    
    if canGuildRepair == nil and cost > GetMoney() then
      ChatFrame1:AddMessage("|cff88ccddRepair:|r Not enough money to repair.")
    else
      RepairAllItems(canGuildRepair)
    
      local moneySpent = GetCoinText(cost)..(canGuildRepair and " (Guild)" or "")
      ChatFrame1:AddMessage("|cff88ccddRepair:|r Spent "..moneySpent.." on repairs.")
    end
  end
end)
f:RegisterEvent("MERCHANT_SHOW")
