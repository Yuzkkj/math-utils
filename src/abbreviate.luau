local suffixes = {
	"",
	"K",
	"M",
	"B",
	"T",
	"Qa",
	"Qi",
	"Sx",
	"Sp",
	"Oc",
	"No",
	"Dc",
}

--[=[
	@function abbreviate
	@within MathUtils
	@param number number
	@return string

	Abbreviates a number with a suffix.

	```lua
	local number = 6969
	local abbreviated = abbreviate(number)

	print(abbreviated) -- 6.69K
	```
]=]
return function(number: number): string
	if tostring(number) == "inf" then
		return "∞"
	end

	for i = 1, #suffixes do
		if number < 10 ^ (i * 3) then
			local abbreviated_number = number / (10 ^ ((i - 1) * 3))

			if abbreviated_number == math.floor(abbreviated_number) then
				return tostring(math.floor(abbreviated_number)) .. suffixes[i]
			else
				return string.format("%.2f", abbreviated_number) .. suffixes[i]
			end
		end
	end

	return tostring(number)
end
