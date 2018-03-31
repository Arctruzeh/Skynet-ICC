function UnitBuffID(unit, id)    
  return UnitBuff(unit, GetSpellInfo(id))
end

function UnitDebuffID(unit, id)    
  return UnitDebuff(unit, GetSpellInfo(id))
end

function CanHeal(unit)
  if UnitExists(unit)
  and UnitIsConnected(unit)
  and not UnitIsCharmed(unit) 
  and not UnitDebuffID(unit, 33786) --Cyclone
  and not UnitIsDeadOrGhost(unit) then
    return true
  end
end

function getHp(unit) 
  if CanHeal(unit) then
    return 100 * UnitHealth(unit) / UnitHealthMax(unit)
  else
    return 200
  end
end

function cdRemains(spellid)
  if select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime()) > 0
  then return select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime())
  else return 0
  end
end

function rangeCheck(spellid,unit)
  if IsSpellInRange(GetSpellInfo(spellid),unit) == 1
  then
    return true
  end
end

function _castSpell(spellid,tar)
  if UnitCastingInfo("player") == nil
  and UnitChannelInfo("player") == nil
  and cdRemains(spellid) == 0 
  and UnitIsDead("player") == nil then
    if tar ~= nil
    and rangeCheck(spellid,tar) == nil then
      return false
    elseif tar ~= nil
    and rangeCheck(spellid,tar) == true then
      CastSpellByID(spellid, tar)
      return true
    elseif tar == nil then
      CastSpellByID(spellid)
      return true
    else
      return false
    end
  end
end

-- Return true if a given type is checked
function ValidUnitType(unitType, unit)
  local isEnemyUnit = UnitCanAttack("player", unit) == 1
  return (isEnemyUnit and unitType == "enemy")
  or (not isEnemyUnit and unitType == "friend")
end

-- Return if a given unit exists, isn't dead
function ValidUnit(unit, unitType) 
  return UnitExists(unit)==1 and ValidUnitType(unitType, unit)
end

function hasCastTime(unit)
  local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(unit)
  local name2, subText2, text2, texture2, startTime2, endTime2, isTradeSkill2, notInterruptible2 = UnitChannelInfo(unit)
  if name or name2 then
    return true
  end
end

