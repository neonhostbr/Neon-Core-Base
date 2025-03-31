-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("admin",Creative)
vSERVER = Tunnel.getInterface("admin")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTWAY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.teleportWay()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		Ped = GetVehiclePedIsUsing(Ped)
    end

	local Wayblip = GetFirstBlipInfoId(8)
	local Coordsblip = GetBlipCoords(Wayblip)
	if DoesBlipExist(Wayblip) then
		for Number = 1,1000 do
			SetEntityCoordsNoOffset(Ped,Coordsblip["x"],Coordsblip["y"],Number + 0.0,1,0,0)

			RequestCollisionAtCoord(Coordsblip["x"],Coordsblip["y"],Coordsblip["z"])
			while not HasCollisionLoadedAroundEntity(Ped) do
				Wait(1)
			end

			if GetGroundZFor_3dCoord(Coordsblip["x"],Coordsblip["y"],Number + 0.0) then
				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTWAY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.teleportLimbo()
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)
	local _,Node = GetNthClosestVehicleNode(Coords["x"],Coords["y"],Coords["z"],1,0,0,0)

	SetEntityCoords(Ped,Node["x"],Node["y"],Node["z"] + 1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:Tuning")
AddEventHandler("admin:Tuning",function()
	local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local Vehicle = GetVehiclePedIsUsing(Ped)

		SetVehicleModKit(Vehicle,0)
		ToggleVehicleMod(Vehicle,18,true)
		SetVehicleMod(Vehicle,11,GetNumVehicleMods(Vehicle,11) - 1,false)
		SetVehicleMod(Vehicle,12,GetNumVehicleMods(Vehicle,12) - 1,false)
		SetVehicleMod(Vehicle,13,GetNumVehicleMods(Vehicle,13) - 1,false)
		SetVehicleMod(Vehicle,15,GetNumVehicleMods(Vehicle,15) - 1,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:INITSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:initSpectate")
AddEventHandler("admin:initSpectate",function(source)
	if not NetworkIsInSpectatorMode() then
		local Pid = GetPlayerFromServerId(source)
		local Ped = GetPlayerPed(Pid)

		LocalPlayer["state"]:set("Spectate",true,false)
		NetworkSetInSpectatorMode(true,Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:RESETSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:resetSpectate")
AddEventHandler("admin:resetSpectate",function()
	if NetworkIsInSpectatorMode() then
		NetworkSetInSpectatorMode(false)
		LocalPlayer["state"]:set("Spectate",false,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("Quake",nil,function(Name,Key,Value)
	ShakeGameplayCam("SKY_DIVING_SHAKE",1.0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Limparea(Coords)
	ClearAreaOfPeds(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfCops(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfObjects(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearAreaOfProjectiles(Coords["x"],Coords["y"],Coords["z"],100.0,0)
	ClearArea(Coords["x"],Coords["y"],Coords["z"],100.0,true,false,false,false)
	ClearAreaOfVehicles(Coords["x"],Coords["y"],Coords["z"],100.0,false,false,false,false,false)
	ClearAreaLeaveVehicleHealth(Coords["x"],Coords["y"],Coords["z"],100.0,false,false,false,false)
end