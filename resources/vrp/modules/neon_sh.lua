Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
vPLAYER = Tunnel.getInterface("player")
vSKINSHOP = Tunnel.getInterface("skinshop")
vTASKBAR = Tunnel.getInterface("taskbar")
vGARAGE = Tunnel.getInterface("garages")
vKEYBOARD = Tunnel.getInterface("keyboard")
vINVENTORY = Tunnel.getInterface("inventory")

local Webhook_nh = Config.Webhook_nh
local TUNNEL_NH = IsDuplicityVersion()
local CLIENT = not nh

if TUNNEL_NH then
    nh = {}
    Tunnel.bindInterface(GetCurrentResourceName(),nh)
    client = Tunnel.getInterface(GetCurrentResourceName())
    Config = module(GetCurrentResourceName(), "config/nh_config")
else
    client = {}
    Tunnel.bindInterface(GetCurrentResourceName(),client)
    Config = module(GetCurrentResourceName(), "config/nh_config")
    nh = Tunnel.getInterface(GetCurrentResourceName())
end



if TUNNEL_NH then
    nh.checkPerm = function(user_id,perms)
        local next = next
        if next(perms) == nil then
            return true
        end
        for i, v in ipairs(perms) do
            if vRP.HasGroup(user_id, v) then
                return true
            end
        end
        return false
    end

    VerifyLog = function(resource,nome)
        if Config.Comandos[nome] then
            if Config.Comandos[nome].webhook then
                return Config.Comandos[nome].webhook
            else
                print('^7 O script '..resource..' tentou localizar uma log '..nome..' na ^3Config.Comandos^7 porem nao foi bem sucessido, e necessario adicionar o ^3webhook = ""^7.')
            end
        else
            print('^7 O script '..resource..' tentou localizar uma log '..nome..' na ^3Config.Comandos^7 porem nao foi bem sucessido, e necessario adicionar.')
        end
    end

    VerifyConfig = function()
        return Config.Emojis,Config.Logo_Cidade
    end

    VerifyConfigAll = function()
        return Config
    end

    ScreenShot = function(source)
        return client.Screenshot(source)
    end

    VerifyPermNeon = function(comando,user_id,perms)
        if not perms or #perms == 0 then
            return true
        end
        
        for _, v in ipairs(perms) do
            if vRP.HasGroup(user_id, v) then
                return true
            end
        end
        
        return false
    end

    exports('VerifyPermNeon', VerifyPermNeon)
    exports('VerifyConfig', VerifyConfig)
    exports('VerifyConfigAll', VerifyConfigAll)
    exports('VerifyLog', VerifyLog)
    exports('ScreenShot', ScreenShot)


else
    client.Screenshot = function()
        local imagem = nil
        exports['screenshot-basic']:requestScreenshotUpload(Webhook_nh, "files[]", function(data)
            if data then
                if json.decode(data).attachment and json.decode(data).attachments[1] then
                    if json.decode(data).attachments[1].url then
                        local url = json.decode(data).attachments[1].url
                        imagem = url
                    end
                end
            end
        end)
        Wait(1500)
        return imagem
    end

    client.reloadFunction = function(arquivo,code)
        if arquivo == "nh_config" then
            assert(load(code))()  
        end
    end
    
    client.reloadMessage = function(arquivo,code)
        print('^7 Arquivo ^3'..arquivo..'.lua^7 recarregado com sucesso.')
    end

    exports('VerifyConfigAllClient', function(param)
        return Config
    end)
end

