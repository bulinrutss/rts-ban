-- NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS
-- TODOS OS DIREITOS AO CRIADOR  'Rutss.Dev'
-- Url 'https://discord.gg/AbjS8gZ'
-- Versão 'vRPEX'
----------------------------------------------------------------------------------------------------------------------
-------------------------------------        VARIÁVEIS       ---------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESETS
-----------------------------------------------------------------------------------------------------------------------------------------
local webhooksetban = "https://discord.com/api/webhooks/853823609373458493/aDqT5OsSloVhG6D6522qgBn9aZEs67W4Xovmf0Y55guj-rrkONCTtBKYL0zK4ijOf8QT"
local comando = "banir"
local perm = "admin.permissao"
local msg = "Você foi BANIDO da cidade."
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(comando,function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,perm) then
		local motivo = vRP.prompt(source,"Motivo:","")
		if motivo == "" then
			return
		end
			if args[1] then
			    vRP.setBanned(parseInt(args[1]),true)
				local identity2 = vRP.getUserIdentity(parseInt(args[1]))
				local id = vRP.getUserSource(parseInt(args[1]))				
				if id then				
				vRP.kick(id,msg)				
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou e baniu o passaporte <b>"..args[1].."</b> da cidade.")
				SendWebhookMessage(webhooksetban,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." \n[BANIU ID]: "..args[1].." "..identity2.firstname.." "..identity2.name.." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
print('^2RTS_BAN ^7Criado por ^1Rutss [Dev] ^7| ^4Marcos .Rutss#5346 ')
--[[
NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS

TODOS OS DIREITOS AO CRIADOR  'Rutss.Dev'
url 'https://discord.gg/AbjS8gZ'
versão 'VRPEX'

NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS
]]