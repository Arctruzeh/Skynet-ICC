if not funcs then funcs = true

  ------------------
  --ROTATION START--
  ------------------
  function Rotation()

    General()

    if talents() == "DK_Blood_Tank" then 
      DK_Blood_Tank()
    elseif talents() == "Druid_Balance" then
      Druid_Balance()
    elseif talents() == "Druid_Restoration" then
      Druid_Restoration()
    elseif talents() == "Hunter_Marksmen" then 
      Hunter_Marksmen()
    elseif talents() == "Mage_Arcane" then
      Mage_Arcane()
    elseif talents() == "Mage_Fire" then
      Mage_Fire()
    elseif talents() == "Paladin_Holy" then
      Paladin_Holy()
    elseif talents() == "Paladin_Protection" then
      Paladin_Protection()
    elseif talents() == "Paladin_Retribution" then
      Paladin_Retribution()
    elseif talents() == "Priest_Discipline" then
      Priest_Shadow()
    elseif talents() == "Priest_Shadow" then
      Priest_Shadow()
    elseif talents() == "Rogue_Assassination" then
      Rogue_Envenom()
    elseif talents() == "Shaman_Elemental" then
      Shaman_Elemental()
    elseif talents() == "Warlock_Affliction" then
      Warlock_Affliction()
    elseif talents() == "Warrior_Fury" then 
      Warrior_Fury()
    elseif talents() == "Warrior_Protection" then 
      Warrior_Protection()
    end

  end
  ----------------
  --ROTATION END--
  ----------------

  rate_counter = 0    
  ahk_rate = 0.20
  enabled = true

  frame = CreateFrame("Frame", nil, UIParent)
  frame:Show()    
  frame:SetScript("OnUpdate", function(self, elapsed)        
      rate_counter = rate_counter + elapsed
      if enabled and rate_counter > ahk_rate then            
        Rotation()            
        rate_counter = 0        
      end    
    end
  )

  -- Disable the rotation
  function Disable()
    enabled = false print("Disabled")
  end

  -- Enable the rotation     
  function Enable()
    enabled = true print("Enabled")
  end

  function Toggle()
    if enabled then Disable() else Enable() end 
  end

  print("Skynet ICC")

end

--Disable on initial load
if enabled then Disable() else Enable() end