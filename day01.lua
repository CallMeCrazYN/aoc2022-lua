local max = 0
local current = 0

-- Get Input from File and get line-Iterator
local function evaluateCalories()
	local elfCalories = {}
	for line in io.lines("calories") do
		if line == "" then
			elfCalories[#elfCalories + 1] = current
			current = 0
		else
			current = current + tonumber(line)
		end
	end

	table.sort(elfCalories, function(a, b)
		return a > b
	end)
	return elfCalories
end

local result = evaluateCalories()
local sum = 0
for i = 1, 3, 1 do
	print(result[i])
	sum = sum + result[i]
end

print("Top three elves total:" .. sum)
