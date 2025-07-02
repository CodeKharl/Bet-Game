-- Simple bet game

PLAYER = "Player"
BANKER = "Banker"

player_sign = PLAYER:sub(1, 1)
banker_sign = BANKER:sub(1, 1)

local function number_values() 
    return math.random(1, 10)
end

local function winner_result(player_val, banker_val)
    print(PLAYER .. " : " .. player_val)
    print(BANKER .. " : " .. banker_val)

	if player_val == banker_val then
		print("Draw!")
		return nil
	end

	return player_val > banker_val and PLAYER or BANKER
end

local function get_user_bet()
	while true do
		io.write("Enter your bet : ")
		local bet = tonumber(io.read())

		if bet then
			return bet
		end

		print("Numbers are only acceptable")
	end
end

local function get_user_choice()
	local prompt_choice =
		string.format("Enter your choice, %s(%s) or %s(%s) : ", PLAYER, player_sign, BANKER, banker_sign)

	while true do
		io.write(prompt_choice)
		local choice = io.read()

		if choice ~= player_sign and choice ~= banker_sign then
			print("Invalid choice! Please input valid one.")
		else
			return choice == player_sign and PLAYER or BANKER
		end
	end
end

local function cash_process(winner, user_choice, user_bet, user_cash)
	if winner == user_choice then
        local cash_win = user_bet * 2
		user_cash = user_cash + cash_win

        print('win : ' .. cash_win)
	end

    user_cash = user_cash - user_bet

    return user_cash
end


CASH = 1000
math.randomseed(os.time())

print("Bet Game: Play Until You Run Out of Cash")

repeat
    print("CASH : " .. CASH)
    local player_val = number_values()
    local banker_val = number_values()

    local bet = get_user_bet()
    local choice = get_user_choice()
    local winner = winner_result(player_val, banker_val)

    if winner then
        print("Winner : " .. winner)
        CASH = cash_process(winner, choice, bet, CASH)
    end
until CASH <= 0

print("You ran out of money. Better luck next time!")
