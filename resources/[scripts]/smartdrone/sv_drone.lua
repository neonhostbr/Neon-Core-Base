
local Proxy = module("vrp", "lib/Proxy") 
vRP = Proxy.getInterface("vRP") 
local item = {
    necessita = false,
    nome = "drone"
}

RegisterCommand("drone", function(source, args, rawCommand)
    local source = source
    if (source > 0) then
        if not item.necessita or vRP.getInventoryItemAmount(vRP.getUserId(source),item.nome) >= 1 then 
            TriggerClientEvent("toggleDrone", source)
            return
        end
        if item.necessita then 
            TriggerClientEvent('Notify',source,'negado','não tem o item necessario para isso!',5000)
        end
    end
end, false)