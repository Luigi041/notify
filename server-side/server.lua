local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- PERMISSÕES POR MENSAGEM

local permadm = "owner.perm"           -- ANUNCIO DE ADM
local permpolicia = "pol.permissao"    -- ANUNCIO DA POLICIA
local permhp = "hp.permissao"          -- ANUNCIO DO HOSPITAL
local tempopolicia = 15000             -- TEMPO DA NOTIFY DA POLICIA (PADRÃO 15 SEGUNDO / 15000ms)
local tempohospital = 15000            -- TEMPO DA NOTIFY DO HOSPITAL (PADRÃO 15 SEGUNDO / 15000ms)

-- NOTIFY DE ADM NÃO POSSUI TEMPO POIS VOCÊ PODE COLOCAR O QUANTO QUISER NA HORA DE MANDAR A MENSAGEM

RegisterCommand('anuncioadm',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permadm) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        local tempo = vRP.prompt(source,"Tempo em segundos:","")
        if mensagem then
        TriggerClientEvent("Notify",-1,"adm","<b>"..titulo.."</b><br>"..mensagem.."<br><br>Mensagem enviada por "..identity.name.."", tempo*1000)
        end
    end
end)

RegisterCommand('anunciopm',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permpolicia) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem then
        TriggerClientEvent("Notify",-1,"policia","<b>"..titulo.."</b><br>"..mensagem.."", tempopolicia)
        end
    end
end)

RegisterCommand('anunciohp',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permhp) then
        local titulo = vRP.prompt(source,"Titulo:","")
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem then
        TriggerClientEvent("Notify",-1,"hospital","<b>"..titulo.."</b><br>"..mensagem.."", tempohospital)
        end
    end
end)


RegisterCommand('teste',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,permadm) then
        TriggerClientEvent("Notify",source,"sucess","<b>Sucesso</b><br>Você ganhou na loteria", 15000)
        TriggerClientEvent("Notify",source,"negado","<b>Negado</b><br>Você perdeu na loteria", 15000)
        TriggerClientEvent("Notify",source,"aviso","<b>Aviso</b><br>Você apostou na loteria", 15000)
        TriggerClientEvent("Notify",source,"adm","<b>Prefeitura</b><br>ADM ganhou na loteria", 15000)
        TriggerClientEvent("Notify",source,"policia","<b>Policia</b><br>Policia pegou o dinheiro da loteria", 15000)
        TriggerClientEvent("Notify",source,"hospital","<b>Hospital</b><br>Curou o atendente da loteria", 15000)
        TriggerClientEvent("Notify",source,"loc","<b>Sucesso</b><br>Você recebeu a localização da loteria", 15000)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^2Script Iniciado^0 - UndergroundStore')
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^1Script Parado^0 - UndergroundStore')
end)