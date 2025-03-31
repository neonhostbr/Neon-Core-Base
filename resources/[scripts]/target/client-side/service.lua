-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Services = {
	{
		["Permission"] = "Policia",
		["Coords"] = vec3(606.43,-5.06,82.75),
		["Distance"] = 2.0,
		["Weight"] = 0.1
	},{
		["Permission"] = "Paramedico",
		["Coords"] = vec3(-1261.7,327.05,65.5),
		["Distance"] = 2.0,
		["Weight"] = 0.1
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIANTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Variants = {
	["LSPD"] = "Policia",
	["BCPR"] = "Policia",
	["BCSO"] = "Policia"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Index,v in pairs(Services) do
		exports["target"]:AddCircleZone("Service:"..Index,v["Coords"],v["Weight"],{
			name = "Service:"..Index,
			heading = 0.0,
			useZ = true
		},{
			Distance = v["Distance"],
			options = {
				{
					event = "target:Service",
					label = "Iniciar Expediente",
					service = v["Permission"],
					tunnel = "proserver"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:CLIENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Client")
AddEventHandler("service:Client",function(Permission,Status)
	for Index,v in pairs(Services) do
		if (Variants[Permission] and Variants[Permission] == v["Permission"]) or Permission == v["Permission"] then
			exports["target"]:LabelText("Service:"..Index,(Status and "Finalizar Expediente" or "Iniciar Expediente"))
		end
	end
end)