local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function ()
  if CanMerchantRepair() then RepairAllItems() end
end)
