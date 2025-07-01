-- Simple bet game

PLAYER = "P"
BANKER = "B"

local function winner_result(player_val, banker_val)
	if player_val == banker_val then
		return nil
	end

	return player_val > banker_val and PLAYER or BANKER
end

local function user_bet()
	while true do
		io.write("Enter your bet : ")

		local bet = tonumber(io.read())

		if bet ~= nil then
			return bet
		end

		print("Numbers are only acceptable")
	end
end

math.randomseed(os.time())

print("Bet Game")

local player_val = math.random()
local banker_val = math.random()

local bet = user_bet()
local winner = winner_result(player_val, banker_val)

print("Outcome : " .. winner)
