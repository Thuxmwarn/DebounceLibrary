-- //Wrote by Thuxmwarn
-- //Creation date: 09/15/2023  

local debounceLib = {}
debounceLib.__index = debounceLib

local function foo()
	-- //FUBAR
end

function debounceLib:SetDelay(debounceDelay)
	assert(typeof(debounceDelay) == "number", "Number expected, got " .. typeof(debounceDelay))

	self.DebounceDelay = debounceDelay
end

function debounceLib:DoDebounce(tempDebounceDelay)
	local debounceDelay
	
	if tempDebounceDelay then
		assert(typeof(tempDebounceDelay) == "number", `Number expected, got {typeof(tempDebounceDelay)}`)

		debounceDelay = tempDebounceDelay
	else
		debounceDelay = self.DebounceDelay
	end

	local debounceClockDelay = (os.clock() - self.OsClock)

	if debounceClockDelay < debounceDelay then
		debounceClockDelay = math.round(((debounceDelay - debounceClockDelay) * 1000)) / 1000
		
		self._callbackFunction(debounceClockDelay)

		return true, debounceClockDelay
	end

	self.OsClock = os.clock()

	return false
end

function debounceLib.New(debounceDelay, callbackFunction)
	assert(typeof(debounceDelay) == "number", "Debounce provided in bad typeof, int wanted.")

	local callbackFunction = typeof(callbackFunction) == "function" and callbackFunction or foo

	local debounceFunctions = {}
	setmetatable(debounceFunctions, debounceLib)

	debounceFunctions.OsClock = 0
	debounceFunctions.DebounceDelay = debounceDelay
	debounceFunctions._callbackFunction = callbackFunction

	return debounceFunctions
end

return debounceLib