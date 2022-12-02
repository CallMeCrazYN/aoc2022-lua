-- score= shape selected+outcome
-- A=Rock   X = 1
-- B=Paper  Y = 2
-- C=ScissorZ = 3
--
-- 1 beats 3 = -2
-- 2 beats 1 =  1
-- 3 beats 2 = 1
-- me - elf -2, 1 , 1

MyScore = 0
MyScorePart2 = 0

--i hate everything about this spaghett
--still fancier than ifSchleife i quess (it's not)
local function getScore(me, elf)
	local matchResult = { [-2] = 6, [1] = 6, [0] = 3 }
	local elfMoves = { ["A"] = 1, ["B"] = 2, ["C"] = 3 }
	local myMoves = { ["X"] = 1, ["Y"] = 2, ["Z"] = 3 }

	return (matchResult[myMoves[me] - elfMoves[elf]] or 0) + (myMoves[me] or 0)
end

local function getScorePart2(me, elf)
	local realRules = {
		["X"] = { ["A"] = 3, ["B"] = 1, ["C"] = 2 },
		["Y"] = { ["A"] = 4, ["B"] = 5, ["C"] = 6 },
		["Z"] = { ["A"] = 2 + 6, ["B"] = 3 + 6, ["C"] = 1 + 6 },
	}
	return realRules[me][elf]
end

for line in io.lines("strategy") do
	MyScore = MyScore + (getScore(line:sub(3, 3), line:sub(1, 1)) or 0)
	MyScorePart2 = MyScorePart2 + getScorePart2(line:sub(3, 3), line:sub(1, 1) or 0)
end
print(MyScore)
print(MyScorePart2)
