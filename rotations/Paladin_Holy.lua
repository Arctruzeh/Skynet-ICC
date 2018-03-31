function Paladin_Holy()

    --who to focus
    if not UnitExists("focus") then
      for _, unit in ipairs(PartyUnits) do
        if UnitClass(unit) == "Warrior" then
          FocusUnit(unit)
        end
      end
    end
  
    --Lowest HP Party Member
    local lowest = nil
    for i=1, #PartyUnits do
      if UnitExists(PartyUnits[i])
      and (lowest == nil or getHp(PartyUnits[i]) < getHp(lowest)) then
        lowest = PartyUnits[i]  
      end
    end
  
    --Lowest HP Party Member without beacon
    local withoutbeacon = nil
    for i=1, #PartyUnits do
      if UnitExists(PartyUnits[i])
      and UnitBuffID(PartyUnits[i], 53563) == nil
      and (withoutbeacon == nil or getHp(PartyUnits[i]) < getHp(withoutbeacon)) then
        withoutbeacon = PartyUnits[i] 
      end
    end
  
    --Hand of Salvation
    if UnitThreatSituation("player") == 3 then 
      _castSpell(1038, "player")
    end
  
    --Seal of Light
    if not UnitBuffID("player",20165) then 
      _castSpell(20165)
    end
  
    --Beacon Focus
    if UnitExists("focus") == 1
    and not UnitBuffID("focus", 53563) then 
      _castSpell(53563, "focus")
    end
  
    --Lay on Hands
    if getHp(lowest) < 10 then 
      _castSpell(48788, withoutbeacon)
    end
  
    --Divine Plea
    if PlayerMana < 75 then
      _castSpell(54428)
    end
  
    --Mana Divine Illumination
    if PlayerMana <= 75  then
      _castSpell(31842)
    end
  
    --Cleanse
    local buff = { 34916, 34917, 34919, 48159, 48160, 30404, 30405, 31117, 34438, 35183, 43522, 47841, 47843, 65812, 68154, 68155, 68156, 44461, 55359, 55360, 55361, 55362, 61429 }
    local group = "party"
    local members = GetNumPartyMembers()
    if GetNumRaidMembers() > 0 then
      group = "raid"
      members = GetNumRaidMembers()
    end
  
    for i = 0, members, 1 do
      if i==0 then mem = "player" else mem = group..tostring(i) end
      if UnitInRange(mem) and UnitIsDeadOrGhost(mem) == nil then
        local candispel = 1
        for k,v in ipairs(buff) do
          if UnitDebuffID(mem,v) then candispel = nil end
        end
        local j = 1
        local debuff,_,_,count,bufftype,dur = UnitDebuff(mem, j)
        while debuff do
          if ((bufftype == "Magic") or (bufftype == "Disease") or (bufftype == "Poison")) and dur > 1 and candispel then
            CastSpellByID(4987,mem)
            return true
          end
          j = j + 1;
          debuff,_,_,count,bufftype,duration = UnitDebuff(mem, j)
        end
      end
    end
  
    --Infusion of Light
    if UnitBuffID("player", 54149) 
    and getHp(lowest) < 85 then
      _castSpell(48785, withoutbeacon)
    end

    --Divine Favor
    if getHp(lowest) < 50 
    and cdRemains(48825) == 0 then
        _castSpell(20216)
      end
  
    --Holy Shock
    if getHp(lowest) < 60 then 
      _castSpell(48825, withoutbeacon)
    end
  
    --Holy Light
    if getHp(lowest) < 85 then 
      _castSpell(48782, withoutbeacon)
    end
  
    --Sacred Shield
    for _, unit in ipairs(PartyUnits) do
      if UnitClass(unit) == "Death Knight" 
      and not UnitBuffID(unit, 53601) then
        _castSpell(53601, unit)
      end
    end
  
    --Judgement of Light
    if UnitExists("focustarget") == 1 then
      _castSpell(20271,"focustarget")
    end
  
  
  end