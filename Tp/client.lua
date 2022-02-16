ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

----------------------------------------------------------------------------------------------------------------------------|

function LzqTps() 
    local Tp = RageUI.CreateMenu(Config.Menu, Config.sousMenu)
    local map = RageUI.CreateSubMenu(Tp, Config.sousMenu2)
    local Labo = RageUI.CreateSubMenu(Tp, Config.sousMenu3)
    local Bunker = RageUI.CreateSubMenu(Tp, Config.sousMenu4)
   
    RageUI.Visible(Tp, not RageUI.Visible(Tp))

    while Tp do
        Citizen.Wait(0)

        RageUI.IsVisible(Tp, true, true, true, function()

              RageUI.Separator(Config.SeparatorP)

              RageUI.ButtonWithStyle(Config.Name, nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, map)

              RageUI.ButtonWithStyle(Config.Name2, nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Labo)

              RageUI.ButtonWithStyle(Config.Name3, nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Bunker)

              end)


----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(map, true, true, true, function()
                RageUI.Separator(Config.Separator2)
                for k,v in pairs(Config.zone) do
                    RageUI.ButtonWithStyle(v.Nom, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if(Selected) then
                        DoScreenFadeOut(1000)
                        Citizen.Wait(2000)
                        RenderScriptCams(false, false, 0, true, true)
                        Wait(1000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        SetEntityVisible(GetPlayerPed(-1), true, 0)
                        RageUI.CloseAll()
                        DoScreenFadeIn(2000)
                        ClearPedTasks(GetPlayerPed(-1))
                        Wait(10)
                        DisplayRadar(true)
                    	SetEntityCoords(PlayerPedId(), Config.ZoneTp)
                    end
                end)
            end

    end, function()
    end)
        

----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Labo, true, true, true, function()
                RageUI.Separator(Config.Separator3)
                for k,v in pairs(Config.zone2) do
                    RageUI.ButtonWithStyle(v.Nom, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if(Selected) then
                        DoScreenFadeOut(1000)
                        Citizen.Wait(2000)
                        RenderScriptCams(false, false, 0, true, true)
                        Wait(1000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        SetEntityVisible(GetPlayerPed(-1), true, 0)
                        RageUI.CloseAll()
                        DoScreenFadeIn(2000)
                        ClearPedTasks(GetPlayerPed(-1))
                        Wait(10)
                        DisplayRadar(true)
                    	SetEntityCoords(PlayerPedId(), Config.ZoneTp2)
                    end
                end)
            end

    end, function()
    end)
        
----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Bunker, true, true, true, function()
                RageUI.Separator(Config.Separator4)
                for k,v in pairs(Config.zone3) do
                    RageUI.ButtonWithStyle(v.Nom, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if(Selected) then
                        DoScreenFadeOut(1000)
                        Citizen.Wait(2000)
                        RenderScriptCams(false, false, 0, true, true)
                        Wait(1000)
                        FreezeEntityPosition(GetPlayerPed(-1), false)
                        SetEntityVisible(GetPlayerPed(-1), true, 0)
                        RageUI.CloseAll()
                        DoScreenFadeIn(2000)
                        ClearPedTasks(GetPlayerPed(-1))
                        Wait(10)
                        DisplayRadar(true)
                    	SetEntityCoords(PlayerPedId(), Config.ZoneTp3)
                    end
                end)
            end

    end, function()
    end)
                
----------------------------------------------------------------------------------------------------------------------------|

 if not RageUI.Visible(Tp) and not RageUI.Visible(map) and not RageUI.Visible(Labo) and not RageUI.Visible(Bunker) then
          Tp = RMenu:DeleteType("Tp", true)
          FreezeEntityPosition(PlayerPedId(), false) -- Freeze joueurs
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------|

Citizen.CreateThread(function()
    local hash = GetHashKey(Config.Peds)
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", Config.Peds, Config.pos.Peds.position.x, Config.pos.Peds.position.y, Config.pos.Peds.position.z, Config.pos.Peds.position.h, false, true)
    SetBlockingOfNonTemporaryEvents(ped, Config.peurped)
    FreezeEntityPosition(ped, Config.freezeped)
    SetEntityInvincible(ped, Config.invincibleped)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, 1)
end)

----------------------------------------------------------------------------------------------------------------------------|

Citizen.CreateThread(function()
    local zonetp = AddBlipForCoord(Config.pos.blips.position.x, Config.pos.blips.position.y, Config.pos.blips.position.z)
    SetBlipSprite  (zonetp, Config.blipsprite) 
    SetBlipDisplay (zonetp, Config.blipdisplay) 
    SetBlipScale   (zonetp, Config.blipscale) 
    SetBlipColour  (zonetp, Config.blipcolour)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Config.blipname)
    EndTextCommandSetBlipName(zonetp)
end)  

----------------------------------------------------------------------------------------------------------------------------|

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.Menu.position.x, Config.pos.Menu.position.y, Config.pos.Menu.position.z)
            if dist3 <= 1.0 then
            Timer = 0   
                RageUI.Text({ message = Config.Message, time_display = 1 })
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(PlayerPedId(), Config.Freeze)
                    LzqTps()
                end   
            end
    Citizen.Wait(Timer)
 end
end)

----------------------------------------------------------------------------------------------------------------------------|

function Camera()
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
end