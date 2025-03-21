Config = {}

Config.Core = "ESX" -- "ESX" / "QB-Core"
Config.CoreExport = function()
    return exports['es_extended']:getSharedObject() -- ESX
    -- return exports['qb-core']:GetCoreObject() -- QB-CORE
end

Config.Notification = function(title, message, type)
    if type == 'success' then
        if GetResourceState('DoliStore_Notify') == 'started' then
            exports['DoliStore_Notify']:_DOLI_CL_SHOW_NOTIFICATION('~g~' .. message .. '~s~', 5000)
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, type)
        end
    elseif type == 'error' then
        if GetResourceState('DoliStore_Notify') == 'started' then
            exports['DoliStore_Notify']:_DOLI_CL_SHOW_NOTIFICATION('~r~' .. message .. '~s~', 5000)
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, type)
        end
    end
end

Config.Translate = {
    ['notify.title.seat_belts'] = 'CEINTURES DE SÉCURITÉ',
    ['notify.seat_belts_buckled'] = 'Les ceintures de sécurité ont été attachées.',
    ['notify.seat_belts_unbuckled'] = 'Les ceintures de sécurité ont été détachées.',

    ['notify.title.cruise_control'] = 'RÉGULATEUR DE VITESSE',
    ['notify.cruise_control_enabled'] = 'Le régulateur de vitesse a été activé à %s%s.',
    ['notify.cruise_control_disabled'] = 'Régulateur de vitesse désactivé.',
    ['notify.your_speed_is_too_small'] = 'Votre vitesse est trop basse pour activer le régulateur de vitesse.',
    ['notify.your_speed_is_too_high'] = 'Votre vitesse est trop élevée pour activer le régulateur de vitesse.',

}

Config.LoopTimeoutHud = 110
Config.LoopTimeoutStatus = 1000

Config.UseVMSGym = GetResourceState('vms_gym') ~= 'missing'
Config.RemoveDrivingSkill = {8, 16} -- with a car accident driving skill is lost - the values in the table {8, 16} is a draw from 8 to 16 or you can set a fixed number

Config.EnableCustomizationMenu = false
Config.CustomizationMenuCommand = 'hud'
Config.CustomizationMenuKey = 'I' -- If you change this key, you need to clear your game cache or change in the game settings, for new players there will be this key
Config.CustomizationMenuDescription = 'Hud Customization'

Config.EnableToggleHud = true
Config.ToggleHudCommand = '+toggle_hud'
Config.ToggleHudKey = 'K' -- If you change this key, you need to clear your game cache or change in the game settings, for new players there will be this key
Config.ToggleHudDescription = 'Toggle hud display'

Config.EnableCruiseControl = true
Config.CruiseControlCommand = 'cruisecontrol'
Config.CruiseControlKey = 'N'
Config.CruiseControlDescription = 'Cruise control'
Config.CruiseControlPressAndRide = true
Config.CruiseControlSpeed = {min = 5.0, max = 110.0}
Config.CruiseControlVehiclesClasses = { -- Classes of vehicles in which cruise control can be activated
    [0] = true, -- Compacts
    [1] = true, -- Sedans
    [2] = true, -- SUVs
    [3] = true, -- Coupes
    [4] = true, -- Muscle
    [5] = true, -- Sports Classics
    [6] = true, -- Sports
    [7] = true, -- Super
    [8] = true, -- Motorcycles
    [9] = true, -- Off-road
    [10] = true, -- Industrial
    [11] = true, -- Utility
    [12] = true, -- Vans
    [13] = false, -- Cycles
    [14] = false, -- Boats
    [15] = false, -- Helicopters
    [16] = false, -- Planes
    [17] = true, -- Service
    [18] = true, -- Emergency
    [19] = true, -- Military
    [20] = true, -- Commercial
    [21] = true, -- Trains
    [22] = true, -- Open Wheel
}

Config.EnableAbilityToggleBigMap = true
Config.BigMapOnlyInVehicle = true
Config.ToggleBigMapCommand = "+toggle_bigmap"
Config.ToggleBigMapKey = "Z"
Config.ToggleBigMapDescription = "Toggle Big Minimap"

Config.DisableSpeedometer = false

Config.DisableHudLogo = false

Config.EnableAmmoCounter = true
Config.EnableShowMaxAmmo = true

Config.EnableSeatBelt = true
Config.SeatBeltCommand = 'seatbelt'
Config.SeatBeltKey = 'B'
Config.SeatBeltDescription = 'Seat belt'

Config.SeatBeltMinimumSpeedToRagdoll = 100 -- The minimum speed at which a player without a seatbelt can fall out of a vehicle
Config.SeatBeltChanceForInstantDeath = 50 -- 50 = 50%
Config.SeatBeltMinimumImpactVal = 2500 -- Minimum impact value in the absence of seat belts for ejection of the player from the vehicle

Config.SeatBeltAlarm = true
Config.SeatBeltAlarmMinimumSpeed = 90.0

-- @SeatBeltVehiclesClasses: false = seat belts cannot be fastened in the vehicle
-- @SeatBeltVehiclesClasses: true = seat belts can be fastened in the vehicle
Config.SeatBeltVehiclesClasses = { -- Classes of vehicles in which seat belts can be fastened
    [0] = true, -- Compacts
    [1] = true, -- Sedans
    [2] = true, -- SUVs
    [3] = true, -- Coupes
    [4] = true, -- Muscle
    [5] = true, -- Sports Classics
    [6] = true, -- Sports
    [7] = true, -- Super
    [8] = false, -- Motorcycles
    [9] = true, -- Off-road
    [10] = true, -- Industrial
    [11] = true, -- Utility
    [12] = true, -- Vans
    [13] = false, -- Cycles
    [14] = false, -- Boats
    [15] = false, -- Helicopters
    [16] = false, -- Planes
    [17] = true, -- Service
    [18] = true, -- Emergency
    [19] = true, -- Military
    [20] = true, -- Commercial
    [21] = true, -- Trains
    [22] = true, -- Open Wheel
}

-- @SeatBeltAntiRagdollVehicles: false = player may fall out
-- @SeatBeltAntiRagdollVehicles: true = player cannot fall out
Config.SeatBeltAntiRagdollVehicles = { -- Vehicle classes that are not taken into account in case of a hard hit (the player will not fall out of them)
    [0] = false, -- Compacts
    [1] = false, -- Sedans
    [2] = false, -- SUVs
    [3] = false, -- Coupes
    [4] = false, -- Muscle
    [5] = false, -- Sports Classics
    [6] = false, -- Sports
    [7] = false, -- Super
    [8] = true, -- Motorcycles
    [9] = false, -- Off-road
    [10] = false, -- Industrial
    [11] = false, -- Utility
    [12] = false, -- Vans
    [13] = true, -- Cycles
    [14] = true, -- Boats
    [15] = true, -- Helicopters
    [16] = true, -- Planes
    [17] = false, -- Service
    [18] = false, -- Emergency
    [19] = false, -- Military
    [20] = false, -- Commercial
    [21] = false, -- Trains
    [22] = false, -- Open Wheel
}

Config.DisableCompass = false
Config.CompassType = "camera" -- "camera" / "vehicle"

Config.DebugStreetNames = false -- use only for development purposes so that you can check street names on F8 and set a custom name to them, do not use when there are players
Config.CustomStreetNames = {
    -- ['AIRP'] = 'National Airport',
    -- ['PBOX'] = 'Hospital',
}

Config.EnableFuel = false

Config.EnableGear = false

Config.EnableDrunkStatus = false

Config.EnableStressStatus = false
Config.EnableStressGenerator = false
Config.EnableStressReducer = false
Config.StressGeneratorMinSpeed = 50.0 -- 50 kmh / 50 mph
Config.EnableStressShooting = false
Config.UseStressEffects = false
Config.StressEffects = {
    {
        stressRange = {20, 50},
        intensity = 1200,
        timeInterval = math.random(50000, 80000),
        actionIn = function(myVehicle)
            TriggerScreenblurFadeIn(1000.0)
        end,
        actionOut = function(myVehicle)
            TriggerScreenblurFadeOut(1000.0)
        end
    },
    {
        stressRange = {50, 65},
        intensity = 1750,
        timeInterval = math.random(40000, 50000),
        actionIn = function(myVehicle)
            TriggerScreenblurFadeIn(1000.0)
        end,
        actionOut = function(myVehicle)
            TriggerScreenblurFadeOut(1000.0)
        end
    },
    {
        stressRange = {65, 80},
        intensity = 2000,
        timeInterval = math.random(30000, 40000),
        actionIn = function(myVehicle)
            TriggerScreenblurFadeIn(1000.0)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.15)
        end,
        actionOut = function(myVehicle)
            TriggerScreenblurFadeOut(1000.0)
            -- SetGameplayCamShakeAmplitude(0.0)
        end
    },
    {
        stressRange = {80, 100},
        intensity = 2500,
        timeInterval = math.random(20000, 30000),
        actionIn = function(myVehicle)
            TriggerScreenblurFadeIn(1500.0)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.2)
        end,
        actionOut = function(myVehicle)
            TriggerScreenblurFadeOut(1500.0)
            -- SetGameplayCamShakeAmplitude(0.0)
        end
    },
}


Config.EnableDamageEffect = false

Config.InfoHudIcons = true -- true: icons  |  false: text from translation.js

Config.EnablePlayerId = true
Config.EnableCashBalance = false
Config.EnableBankBalance = false
Config.EnableBlackMoneyBalance = false
Config.EnableCompanyBalance = false

Config.EnablePlayerJob = false
Config.EnablePlayerJobGrade = false

Config.EnablePlayerGang = false
Config.EnablePlayerGangGrade = false


Config.UnitOfSpeed = 'kmh' -- 'kmh' or 'mph'

Config.DisableGTAHudInVehicle = true -- removes the natives gta 5 display of street names, etc.

Config.DisablePositioningOnCenterOfScreen = true -- this will prevent the player from setting the status icon in the middle of the screen and using that as, for example, a shooting dot

Config.UseCustomMinimap = false
Config.MapBigBypass = false
Config.FirstMinimap = 'square' -- 'circle' / 'square'
Config.MinimapZoom = 1100
Config.EnableManageMinimapDisplay = false
Config.MinimapDisplayType = "1" -- "1": Always Show / "2": Never Show  / "3": Only in vehicle

Config.FirstSpeedometer = 'circle' -- 'circle' / 'linear'

Config.PMAVoiceRanges = {
    [1] = 25,
    [2] = 60,
    [3] = 100,
}

Config.MumbleVoipRanges = {
    [1] = 25,
    [2] = 60,
    [3] = 100,
}

Config.SaltyChatRanges = {
    [3.0] = 10,
    [8.0] = 30,
    [15.0] = 65,
    [32.0] = 100,
}

Config.GetStatus = function()
    -- FOR QB-Core is in the config.client.lua
    if Config.Core == "ESX" then
        local data = {}
        TriggerEvent("esx_status:getStatus", "hunger", function(hungerStat)
            data.hunger = hungerStat.getPercent()
        end)
        TriggerEvent("esx_status:getStatus", "thirst", function(thirstStat)
            data.thirst = thirstStat.getPercent()
        end)
        if Config.EnableStressStatus then
            TriggerEvent("esx_status:getStatus", "stress", function(stressStat)
                data.stress = stressStat.getPercent()
            end)
        end
        if Config.EnableDrunkStatus then
            TriggerEvent("esx_status:getStatus", "drunk", function(drunkStat)
                data.drunk = drunkStat.getPercent()
            end)
        end
        return data
    end
end

Config.GetFuel = function(vehicle)
    return GetVehicleFuelLevel(vehicle)
    -- return exports['LegacyFuel']:GetFuel(vehicle)
end

Config.GetVehicleDamage = function(vehicle)
    return GetVehicleEngineHealth(vehicle)
end