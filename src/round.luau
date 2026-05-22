--[=[
	@function round
	@within MathUtils
	@param number number
	@param decimals number
	@return number

	Rounds a number to the given number of decimal places.

	```lua
	local number = 69.696
	local rounded = round(number, 2)

	print(rounded) -- 69.69
	```
]=]
return function(number: number, decimals: number): number
	local mult = 10 ^ decimals
	return math.floor(number * mult + 0.5) / mult
end