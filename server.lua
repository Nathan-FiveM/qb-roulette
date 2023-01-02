QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb_roulette:removemoney')
AddEventHandler('qb_roulette:removemoney', function(amount)
	local amount = amount
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	xPlayer.Functions.RemoveItem('casinochips', amount)
end)

RegisterServerEvent('qb_roulette:givemoney')
AddEventHandler('qb_roulette:givemoney', function(action, amount)
	local aciton = aciton
	local amount = amount
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	if action == 'black' or action == 'red' then
		local win = amount*2
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'green' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red1' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black2' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red3' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black4' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red5' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black6' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red7' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black8' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red9' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black10' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black11' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red12' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black13' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red14' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black15' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red16' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black17' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red18' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red19' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black20' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red21' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black22' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red23' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black24' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red25' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black26' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red27' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black28' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black29' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red30' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black31' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red32' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black33' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red34' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'black35' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	elseif action == 'red36' then
		local win = amount*36
		xPlayer.Functions.AddItem('casinochips', win)
	else
	end
end)

QBCore.Functions.CreateCallback('qb_roulette:check_money', function(source, cb)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local quantity = xPlayer.Functions.GetItemByName('casinochips').amount
	
	cb(quantity)
end)
