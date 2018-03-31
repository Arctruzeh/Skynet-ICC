function Hunter_Marksmen()

  --Kill Shot
  if getHp(unit) <= 20 then
    _castSpell(61006, "target")
  end

  --Readiness
  if cdRemains(53209) ~= 0 --Chimera
  and cdRemains(3045) ~= 0 --Rapide Fire
  and not UnitBuffID("player", 3045) --Rapid Fire
  then 
    _castSpell(23989) 
  end

  --Mend Pet
  if UnitExists("playerpet")
  and not UnitIsDeadOrGhost("playerpet")
  and not UnitBuffID("playerpet", 48990)    
  and getHp("playerpet") < 70 then 
    _castSpell(48990)
  end

  --Trueshot Aura
  if not UnitBuffID("player", 19506) then 
    _castSpell(19506) 
  end

  local PlayerMana = 100 * UnitPower("player") / UnitPowerMax("player")

  --Viper
  if PlayerMana < 10 
  and not UnitBuffID("player", 34074) then 
    _castSpell(34074) 
  end

  --Dragonhawk
  if PlayerMana > 70 
  and not UnitBuffID("player", 61847) then 
    _castSpell(61847) 
  end

  --Hunter's Mark
  if not UnitDebuffID("target", 53338) then
    _castSpell(53338, "target") 
  end

  --Aimed Shot
  _castSpell(49050, "target") 

  --SS
  if not UnitDebuffID("target", 49001) then
    _castSpell(49001,"target") 
  end

  --Chimera Shot
  if UnitDebuffID("target", 49001) then --SS
    _castSpell(53209,"target") 
  end

  --Arcane Shot
  _castSpell(49045,"target")

  --Rapid Fire
  if ValidUnit("target", "enemy") then
    _castSpell(3045)
  end

  --Steady Shot
  _castSpell(49052,"target")

  --Pet Attac
  if UnitExists("playerpet")
  and not UnitExists("playerpettarget") then
    PetAttack("target")
  end

  --Call Pet
  if UnitExists("playerpet") ~= 1 then 
    _castSpell(883)
  end

  --Revive Pet
  if UnitExists("playerpet") == 1 then
    if UnitIsDeadOrGhost("playerpet") then 
      _castSpell(982) 
    end
  end

end