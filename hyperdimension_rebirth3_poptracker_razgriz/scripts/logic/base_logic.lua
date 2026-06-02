
-- this is the file to put all your custom logic functions into.
-- if you dont want to use the json based logic you can switch to a graph-based logic method.
-- the needed functions for that are in `/scripts/logic/graph_logic/logic_main.lua`.



-- function <name> (<parameters if needed>)
--     <actual code>
--     <indentations are just for readability>
-- end
--
  



function getNeptuneStrength()
    if Tracker:ProviderCountForCode("characterneptune") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("neptuneprogressiveweapons")
    if tier == 1 then return 400
    elseif tier == 2 then return 750
    elseif tier == 3 then return 1050
    elseif tier == 4 then return 1450
    elseif tier == 5 then return 2150
    elseif tier >= 6 then return 2350
    else
        return 50
    end
end

function getNoireStrength()
    if Tracker:ProviderCountForCode("characternoire") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("noireprogressiveweapons")
    if tier == 1 then return 400
    elseif tier == 2 then return 750
    elseif tier == 3 then return 1050
    elseif tier == 4 then return 1450
    elseif tier == 5 then return 2150
    elseif tier >= 6 then return 2350
    else
        return 50
    end
end

function getPlutiaStrength()
    if Tracker:ProviderCountForCode("characterplutia") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("plutiaprogressiveweapons")
    if tier == 1 then return 400
    elseif tier == 2 then return 750
    elseif tier == 3 then return 1050
    elseif tier == 4 then return 1450
    elseif tier == 5 then return 2150
    elseif tier >= 6 then return 2350
    else
        return 50
    end
end

function getBlancStrength()
    if Tracker:ProviderCountForCode("characterblanc") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("blancprogressiveweapons")
    if tier == 1 then return 550
    elseif tier == 2 then return 900
    elseif tier == 3 then return 1150
    elseif tier == 4 then return 1500
    elseif tier >= 5 then return 2200
    else
        return 275
    end
end

function getVertStrength()
    if Tracker:ProviderCountForCode("charactervert") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("vertprogressiveweapons")
    if tier == 1 then return 550
    elseif tier == 2 then return 900
    elseif tier == 3 then return 1150
    elseif tier == 4 then return 1500
    elseif tier >= 5 then return 2200
    else
        return 275
    end
end

function getNepgearStrength()
    if Tracker:ProviderCountForCode("characternepgear") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("nepgearprogressiveweapons")
    if tier == 1 then return 550
    elseif tier == 2 then return 900
    elseif tier == 3 then return 1150
    elseif tier == 4 then return 1500
    elseif tier >= 5 then return 2200
    else
        return 275
    end
end

function getPeashyStrength()
    if Tracker:ProviderCountForCode("characterpeashy") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("peashyprogressiveweapons")
    if tier == 1 then return 1200
    elseif tier == 2 then return 1450
    elseif tier == 3 then return 1800
    elseif tier == 4 then return 1800
    elseif tier >= 5 then return 2200
    else
        return 1050
    end
end

function getUniStrength()
    if Tracker:ProviderCountForCode("characteruni") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("uniprogressiveweapons")
    if tier == 1 then return 1300
    elseif tier == 2 then return 1450
    elseif tier == 3 then return 2100
    elseif tier >= 4 then return 2350
    else
        return 1150
    end
end

function getRomStrength()
    if Tracker:ProviderCountForCode("characterrom") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("romprogressiveweapons")
    if tier == 1 then return 1300
    elseif tier == 2 then return 1450
    elseif tier == 3 then return 2100
    elseif tier >= 4 then return 2350
    else
        return 1150
    end
end

function getRamStrength()
    if Tracker:ProviderCountForCode("characterram") == 0 then
        return 0
    end

    local tier = Tracker:ProviderCountForCode("ramprogressiveweapons")
    if tier == 1 then return 1300
    elseif tier == 2 then return 1450
    elseif tier == 3 then return 2100
    elseif tier >= 4 then return 2350
    else
        return 1150
    end
end

-- Returns the sum of the top 4 strongest characters' power
function getTop4Strength()
    local strengths = {}

    -- Add every character's current strength
    table.insert(strengths, getNeptuneStrength())
    table.insert(strengths, getNoireStrength())
    table.insert(strengths, getPlutiaStrength())
    table.insert(strengths, getNepgearStrength())
    table.insert(strengths, getBlancStrength())
    table.insert(strengths, getVertStrength())
    table.insert(strengths, getPeashyStrength())
    table.insert(strengths, getUniStrength())
    table.insert(strengths, getRomStrength())
    table.insert(strengths, getRamStrength())

    -- Sort descending and sum the top 4
    table.sort(strengths, function(a, b) return a > b end)

    local total = 0
    for i = 1, 4 do
        if strengths[i] then
            total = total + strengths[i]
        end
    end
    return total
end

function hasGrindLevel10()
    if Tracker:ProviderCountForCode("dungeonunlockjetsetrange") == 1 or
       Tracker:ProviderCountForCode("dungeonunlockjetsetpeak") == 1 or
       Tracker:ProviderCountForCode("dungeonunlockotoriforest") == 1 or
       Tracker:ProviderCountForCode("dungeonunlockstationarea") == 1 or
       Tracker:ProviderCountForCode("dungeonunlockvirtuaforestsafezone") == 1 or
       Tracker:ProviderCountForCode("dungeonunlockzecaruinsno1") == 1 then
        return 1
    end
    return 0
end

function hasGrindLevel20()
    if Tracker:ProviderCountForCode("cangrindlevel20") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel30()
    if hasGrindLevel20() == 1 and Tracker:ProviderCountForCode("cangrindlevel30") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel40()
    if hasGrindLevel30() == 1 and Tracker:ProviderCountForCode("cangrindlevel40") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel50()
    if hasGrindLevel40() == 1 and Tracker:ProviderCountForCode("cangrindlevel50") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel60()
    if hasGrindLevel50() == 1 and Tracker:ProviderCountForCode("cangrindlevel60") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel70()
    if hasGrindLevel60() == 1 and Tracker:ProviderCountForCode("cangrindlevel70") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel80()
    if hasGrindLevel70() == 1 and Tracker:ProviderCountForCode("cangrindlevel80") >= 1 then
        return 1
    end
    return 0
end

function hasGrindLevel90()
    if hasGrindLevel80() == 1 and Tracker:ProviderCountForCode("cangrindlevel90") >= 1 then
        return 1
    end
    return 0
end

function canAccessVirtuaForestSafeZone()
    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 0 and armor_tier >= 0 then
        return 1
    else
        return 0
    end
end

function canAccessZecaRuinsNo1()
    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 250 and armor_tier >= 0 then
        return 1
    else
        return 0
    end
end

function canAccessJetSetRange()
    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 250 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessLoweeCastleExterior()
    if hasGrindLevel20() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 300 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessCastleChambers()
    if hasGrindLevel20() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 350 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessHaloForest()
    if hasGrindLevel30() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 350 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessBandicrash()
    if hasGrindLevel10() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 400 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessSoniWetlands()
    if hasGrindLevel20() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 400 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessKuzaratFacility2()
    if hasGrindLevel10() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 450 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessZecaRuinsNo2()
    if hasGrindLevel10() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 500 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessMetroidShelterDepths()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 600 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessZegaForest()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 650 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessGigoMainEntrance()
    if hasGrindLevel30() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 900 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessRudArmsSewerN()
    if hasGrindLevel20() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 950 and armor_tier >= 1 then
        return 1
    else
        return 0
    end
end

function canAccessNationalFactory()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1000 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessReloadGrasslands()
    if hasGrindLevel20() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1100 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessMines()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1100 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessLujiPlateau()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1250 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessPSDimension()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1300 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessMetroidShelter()
    if hasGrindLevel40() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1350 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessAdaldikForest()
    if hasGrindLevel30() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1450 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessSuahoMountainRange()
    if hasGrindLevel30() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 1750 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessOtoriCave()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 2300 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessLoweeCastleSouthernSpace()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 2550 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessHanedaMountainRange()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 2750 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessExtradimensionalSpace()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 2750 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessPowerlevelIsland()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3050 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessVidaDimension()
    if hasGrindLevel70() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3050 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessKobabaRuins()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3145 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessNekutokiForest()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3150 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessSoShalForest()
    if hasGrindLevel70() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3250 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessLoweeCastleNorthernSpace()
    if hasGrindLevel70() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3500 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessArioPlateau()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3530 and armor_tier >= 2 then
        return 1
    else
        return 0
    end
end

function canAccessVirtuaForest()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3650 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessGraphicPass()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3750 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessKeragaDimension()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3750 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessDuoRRuins()
    if hasGrindLevel80() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 3750 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessEMESMagmaCave()
    if hasGrindLevel70() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 4250 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessAnonydeathsLab()
    if hasGrindLevel50() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 4550 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessDoTemple()
    if hasGrindLevel90() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 4675 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessKoaguraPlateau()
    if hasGrindLevel90() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 4750 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessPiiShiiGameFactory()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 5050 and armor_tier >= 3 then
        return 1
    else
        return 0
    end
end

function canAccessDigitalFutureLand()
    if hasGrindLevel90() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 5050 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessCityCenter()
    if hasGrindLevel60() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 5080 and armor_tier >= 5 then
        return 1
    else
        return 0
    end
end

function canAccessUnderInverse()
    if hasGrindLevel90() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 5550 and armor_tier >= 4 then
        return 1
    else
        return 0
    end
end

function canAccessPlaneptuneAlley()
    if hasGrindLevel90() == 0 then
        return 0
    end

    local total_strength = getTop4Strength()
    local armor_tier = Tracker:ProviderCountForCode("progressivearmor")

    if total_strength >= 9000 and armor_tier >= 5 then
        return 1
    else
        return 0
    end
end