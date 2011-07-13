local f = CreateFrame("Frame")
f:SetScript("OnEvent", function ()
  local cost, canRepair = GetRepairAllCost()
  
  if canRepair then
    local canGuildRepair = CanGuildBankRepair()
    local moneySpent = GetCoinText(cost)..(canGuildRepair and " (Guild)" or "")
    
    RepairAllItems(canGuildRepair)
    
    ChatFrame1:AddMessage("|cff88ccddRepair:|r Spent "..moneySpent.." on repairs.")
  end
end)
f:RegisterEvent("MERCHANT_SHOW")
