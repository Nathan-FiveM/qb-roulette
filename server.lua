QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj)
	QBCore = obj
end)

RegisterServerEvent('qb_roulette:removemoney')

AddEventHandler('qb_roulette:removemoney', function(amount)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	xPlayer.Functions.RemoveItem('casinochips', amount)
end)

-- if you get red or black then get 2x if you get green then 36x
local validValues = {
	["green"] = 36, -- btw, client says x14 and server said x36, did you mean to put x14? left it at 36 since that's what it was before
	["red"] = 2,
	["black"] = 2
}

-- using the tables you made since for some reason the red isn't all even like it's meant to be
local red = {32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3}

local black = {15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26}

for k, v in ipairs(red) do
	validValues["red" .. v] = 32
end

for k, v in ipairs(black) do
	validValues["black" .. v] = 32
end

RegisterServerEvent('qb_roulette:givemoney')

-- super exploitable btw, why is the client determining if they win?
AddEventHandler('qb_roulette:givemoney', function(action, amount)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local win = validValues[action]

	if win then
		xPlayer.Functions.AddItem('casinochips', win)
	end
end)

QBCore.Functions.CreateCallback('qb_roulette:check_money', function(source, cb)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local quantity = xPlayer.Functions.GetItemByName('casinochips').amount
	cb(quantity)
end)