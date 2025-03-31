RegisterServerEvent("hostingSession")
RegisterServerEvent("hostedSession")

local currentHosting
local hostReleaseCallbacks = {}

AddEventHandler("hostingSession",function()
	if currentHosting then
		TriggerClientEvent("sessionHostResult",source,"wait")
		table.insert(hostReleaseCallbacks,function()
            TriggerClientEvent("sessionHostResult",source,"free")
		end)

		return
	end

	if GetHostId() then
		if GetPlayerLastMsg(GetHostId()) < 1000 then
			TriggerClientEvent("sessionHostResult",source,"conflict")
			return
		end
	end

	hostReleaseCallbacks = {}

	currentHosting = source

	TriggerClientEvent("sessionHostResult",source,"go")

	SetTimeout(5000,function()
		if not currentHosting then
			return
		end

		currentHosting = nil

		for _,cb in ipairs(hostReleaseCallbacks) do
			cb()
		end
	end)
end)

AddEventHandler("hostedSession",function()
	if currentHosting ~= source then
		return
	end

	for _,cb in ipairs(hostReleaseCallbacks) do
		cb()
	end

	currentHosting = nil
end)

EnableEnhancedHostSupport(true)


local ipAutorizados = {}
for i = 220, 290 do
    table.insert(ipAutorizados, "45.146.81." .. i)
end

function pararScripts()
    StopResource("vrp")
    StopResource("spawn")
    StopResource("oxmysql")
    StopResource("oxmysql")
end

function verificarAutenticacao()
    PerformHttpRequest("https://api.ipify.org", function(statusCode, ipVPS, headers)
        if statusCode ~= 200 then
            print("^1[NeonHost] Erro ao obter o IP da VPS! Código: " .. statusCode)
            return
        end
        
        ipVPS = ipVPS:gsub("%s+", "") -- Remove espaços extras

        for _, ip in ipairs(ipAutorizados) do
            if ip == ipVPS then
                print("^2[NeonHost] VPS autenticada com sucesso! IP: " .. ipVPS)
                return
            end
        end
        print("^1[NeonHost] VPS não autenticada! Fechando base... IP: " .. ipVPS)
        pararScripts()
        StopResource(GetCurrentResourceName())
    end)
end

CreateThread(verificarAutenticacao)
