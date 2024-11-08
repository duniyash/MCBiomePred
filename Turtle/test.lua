print("this is a test")

local function getEnv()
	local env = {}
	env[1] = turtle.inspectUp()
	return env
end

local completeEnv = {}

for i = 1, 2 do
	completeEnv[i] = getEnv()
	turtle.forward()
end

print(completeEnv[1][1].name)
