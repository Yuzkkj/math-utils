--[=[
	Rounds a number to the specified number of decimal places.

	```luau
	local number = 69.696
	local rounded = round(number, 2)

	print(rounded) -- 69.69
	```

	@param number number
	@param decimals number

	@return The rounded number
]=]
return function(number: number, decimals: number): number
	local mult = 10 ^ decimals
	return math.floor(number * mult + 0.5) / mult
end