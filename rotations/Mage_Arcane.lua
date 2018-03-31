function Mage_Arcane()

    local _,_,_,count = UnitDebuffID("player",36032)
  
  --Molten Armor
    if not UnitBuffID("player",43046) then 
      _castSpell(43046)
    end
  
  --Conjure Mana Gem
    if GetItemCount("Mana Sapphire") == 0 
    and not UnitAffectingCombat("player") then 
      _castSpell(42985)
    end
  
  --Ice Block
    if UnitThreatSituation("player") == 3
    or PlayerHealth <= 20 then 
      _castSpell(45438)
    end
  
  --Spellsteal
    buff = { 43242, 31884, 2825, 32182, 1719, 17, 33763, 6940, 67108, 67107, 67106, 66228 }
    local havebuff = nil
  
    for i,v in ipairs(buff) do
      local _,_,_,_,_,_,_,_,isStealable = UnitBuffID("target",v)
      if isStealable then havebuff = 1 end
    end
  
    if havebuff
    and IsSpellInRange("Spellsteal", "target") == 1 then 
      _castSpell(30449, "target") 
    end
  
  --Evocation
    if PlayerMana <= 20 
    and not UnitBuffID("player", 44401) then 
      _castSpell(12051) 
    end
  
  --Mana Gem
    if PlayerMana <= 60 
    and GetItemCount("Mana Sapphire") == 1 
    and GetItemCooldown("Mana Sapphire") == 0 
    and UnitChannelInfo("player") == nil
    and UnitCastingInfo("player") == nil
    then
      UseItemByName("Mana Sapphire")
    end
  
  --PoM
    if UnitLevel("target") == -1 then 
      _castSpell(12043) 
    end
  
  --Mirror Image
    if UnitThreatSituation("player") == 3
    or UnitBuffID("player", 12472) 
    or UnitBuffID("player", 12042) then 
      _castSpell(55342)
    end
  
  --Arcane Power
    if count == 4
    and PlayerMana >= 40
    and UnitLevel("target") == -1 then 
      _castSpell(12042)
    end
  
  --Icy Veins
    if count == 4
    and PlayerMana >= 40
    and UnitLevel("target") == -1 then 
      _castSpell(12472)
    end
  
  --Arcane Missiles
    if count == 4 
    and UnitBuffID("player", 44401) then 
      _castSpell(42846, "target") 
    end

    --Arcane Missiles
    if PlayerMana <= 20
    and cdRemains(12051) ~= 0
    and UnitBuffID("player", 44401) then 
        _castSpell(42846, "target") 
    end
  
  --Arcane Blast
    _castSpell(42897, "target") 
  
  end