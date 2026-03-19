local round = require(script.Parent.round)

--[=[
    Formats a number as currency with commas.

    ```luau
    local number = 6969
    local formatted = formatCurrency(number)

    print(formatted) -- 6,969
    ```

    @param number number
	
    @return The formatted number
]=]
return function(number: number): string
	local isNegative = number < 0
	number = math.abs(number)

	number = round(number, 2)

	local formatted = tostring(number)
	local k

	while true do
		formatted, k = string.gsub(formatted, "^(%d+)(%d%d%d)", "%1,%2")
		if k == 0 then
			break
		end
	end

	return (isNegative and "-" or "") .. formatted
end
