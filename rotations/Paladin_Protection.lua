function Paladin_Protection()

    if GetRaidTargetIndex("player") == nil then
        SetRaidTarget("player", 8)
    end

    for i=1, GetNumRaidMembers() do 
        if not UnitBuffID(UnitName("raid"..i), 20911) then
            _castSpell(20911, UnitName("raid"..i))
        end
    end

end