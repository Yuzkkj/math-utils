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
    Abbreviates a number with a suffix.

    ```luau
    local number = 6969
    local abbreviated = abbreviate(number)
	
    print(abbreviated) -- 6.69K
    ```

    @param number number

    @return The formatted string
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
