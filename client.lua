local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

local pic = 'CHAR_SOCIAL_CLUB' -- unused variable?
local game_during = false
local elements = {} -- unused variable?

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('qb-roulette:start')
AddEventHandler('qb-roulette:start', function()
	-- QBCore.Functions.TriggerCallback('qb-casinojob:check_gold_status', function(result)
		-- QBCore.Functions.TriggerCallback('qb-casinojob:check_diamond_status', function(result1)
			-- if result or result1 then
				QBCore.Functions.TriggerCallback('qb_roulette:check_money', function(quantity)
					if quantity >= 10 then
						SendNUIMessage({
							type = "show_table",
							zetony = quantity
						})
						SetNuiFocus(true, true)
					else
						QBCore.Functions.Notify('You need at least 10 chips to play!!')
						SendNUIMessage({
							type = "reset_bet"
						})
					end
				end, '')
			-- else
				-- QBCore.Functions.Notify("You do not have a Gold Tier Membership or Higher!", "error")
			-- end
		-- end)
			-- end
end)

RegisterNUICallback('exit', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
end)

RegisterNUICallback('betup', function(data, cb)
	cb('ok')
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'betup', 1.0)
end)

RegisterNUICallback('roll', function(data, cb)
	cb('ok')
	TriggerEvent('qb_roulette:start_game', data.kolor, data.kwota)
end)

local red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3}; -- shouldn't red be all the even numbers not some even and some odd?
local black = {15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26};
local validValues = {[0] = "green"}
local multiplier = {["green"] = 14, ["red"] = 2, ["black"] = 2} -- OR 36

for k,v in ipairs(red) do -- easy indexing trick
	red[v] = true
	validValues[v] = "red"..v
end

for k,v in ipairs(black) do
	black[v] = true
	validValues[v] = "black"..v
end

RegisterNetEvent('qb_roulette:start_game')
AddEventHandler('qb_roulette:start_game', function(action, amount)
	if amount > 1000000 then
		QBCore.Functions.Notify('Maximum bet on this table is $1,000,000')
			SendNUIMessage({
				type = "reset_bet"
			})
		return
	end
		
	if game_during == false then
		TriggerServerEvent('qb_roulette:removemoney', amount)
		TriggerEvent('pNotify:SendNotification', {text = "You have bet "..amount.." chips on "..action..". The wheel is spinning..."})
		game_during = true
		local randomNumber = math.random(0,36)
		
		SendNUIMessage({
			type = "show_roulette",
			hwButton = randomNumber
		})
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'qb-roulette', 1.0)
		Citizen.Wait(10000)
		
		local mult = multiplier[action] or 36
		if action == validValues[randomNumber] or action == "red" and red[randomNumber] or action == "black" and black[randomNumber] then
			QBCore.Functions.Notify('You won '.. (amount * mult) ..' chips!')
			TriggerServerEvent('qb_roulette:givemoney', action, amount) -- exploit located
		else
			QBCore.Functions.Notify('Not this time. Try again! Good luck!')
		end

		--TriggerServerEvent('roulette:givemoney', randomNumber)
		SendNUIMessage({type = 'hide_roulette'})
		SetNuiFocus(false, false)
		--QBCore.Functions.Notify('Gra end!')
		game_during = false
		TriggerEvent('qb-roulette:start')
	else
		QBCore.Functions.Notify('The wheel is spinning...')
	end
end)
