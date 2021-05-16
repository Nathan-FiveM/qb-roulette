QBCore = nil

Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

local pic = 'CHAR_SOCIAL_CLUB'
local game_during = false
local elements = {}

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

RegisterNetEvent('qb_roulette:start_game')
AddEventHandler('qb_roulette:start_game', function(action, amount)
	local amount = amount
	if amount <= 1000000 then
		
	if game_during == false then
		TriggerServerEvent('qb_roulette:removemoney', amount)
		local kolorBetu = action
		TriggerEvent('pNotify:SendNotification', {text = "You have bet "..amount.." chips on "..kolorBetu..". The wheel is spinning..."})
		game_during = true
		local randomNumber = math.floor(math.random() * 36)
		--local randomNumber = 0
		SendNUIMessage({
			type = "show_roulette",
			hwButton = randomNumber
		})
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'qb-roulette', 1.0)
		Citizen.Wait(10000)
		local red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3};
		local black = {15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26};
		local function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end
			return false
		end
		if action == 'black' then
			if has_value(black, randomNumber) then
				local win = amount * 2
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red' then
			local win = amount * 2
			if has_value(red, randomNumber) then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'green' then
			local win = amount * 14
			if randomNumber == 0 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red1' then
			local win = amount * 36
			if randomNumber == 1 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black2' then
			local win = amount * 36
			if randomNumber == 2 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red3' then
			local win = amount * 36
			if randomNumber == 3 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black4' then
			local win = amount * 36
			if randomNumber == 4 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red5' then
			local win = amount * 36
			if randomNumber == 5 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black6' then
			local win = amount * 36
			if randomNumber == 6 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red7' then
			local win = amount * 36
			if randomNumber == 7 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black8' then
			local win = amount * 36
			if randomNumber == 8 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red9' then
			local win = amount * 36
			if randomNumber == 9 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black10' then
			local win = amount * 36
			if randomNumber == 10 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black11' then
			local win = amount * 36
			if randomNumber == 11 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red12' then
			local win = amount * 36
			if randomNumber == 12 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black13' then
			local win = amount * 36
			if randomNumber == 13 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red14' then
			local win = amount * 36
			if randomNumber == 14 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black15' then
			local win = amount * 36
			if randomNumber == 15 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red16' then
			local win = amount * 36
			if randomNumber == 16 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black17' then
			local win = amount * 36
			if randomNumber == 17 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red18' then
			local win = amount * 36
			if randomNumber == 18 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red19' then
			local win = amount * 36
			if randomNumber == 19 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black20' then
			local win = amount * 36
			if randomNumber == 20 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red21' then
			local win = amount * 36
			if randomNumber == 21 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black22' then
			local win = amount * 36
			if randomNumber == 22 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red23' then
			local win = amount * 36
			if randomNumber == 23 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black24' then
			local win = amount * 36
			if randomNumber == 24 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red25' then
			local win = amount * 36
			if randomNumber == 25 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black26' then
			local win = amount * 36
			if randomNumber == 26 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red27' then
			local win = amount * 36
			if randomNumber == 27 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black28' then
			local win = amount * 36
			if randomNumber == 28 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black29' then
			local win = amount * 36
			if randomNumber == 29 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red30' then
			local win = amount * 36
			if randomNumber == 30 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black31' then
			local win = amount * 36
			if randomNumber == 31 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red32' then
			local win = amount * 36
			if randomNumber == 32 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black33' then
			local win = amount * 36
			if randomNumber == 33 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red34' then
			local win = amount * 36
			if randomNumber == 34 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'black35' then
			local win = amount * 36
			if randomNumber == 35 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
		elseif action == 'red36' then
			local win = amount * 36
			if randomNumber == 36 then
				QBCore.Functions.Notify('You won '..win..' chips!')
				TriggerServerEvent('qb_roulette:givemoney', action, amount)
			else
				QBCore.Functions.Notify('Not this time. Try again! Good luck!')
			end
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
	else
		QBCore.Functions.Notify('Maximum bet on this table is $1,000,000')
			SendNUIMessage({
				type = "reset_bet"
			})
	end
end)