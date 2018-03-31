function talents()
    if IsSpellKnown(55262) then
        return "DK_Blood_Tank"
    elseif IsSpellKnown(53251) then
        return "Druid_Restoration"
    elseif IsSpellKnown(53209) then
        return "Hunter_Marksmen"
    elseif IsSpellKnown(spellID) then
        return "Mage_Fire"
    elseif IsSpellKnown(spellID) then
        return "Paladin_Holy"
    elseif IsSpellKnown(spellID) then
        return "Priest_Shadow"
    elseif IsSpellKnown(spellID) then
        return "Rogue_Assassination"
    elseif IsSpellKnown(spellID) then
        return "Shaman_Elemental"
    elseif IsSpellKnown(spellID) then
        return "Warlock_Affliction"
    elseif IsSpellKnown(spellID) then
        return "Warrior_Protection"
    end
end