local multipliers = {
	K = 1e3,
	M = 1e6,
	B = 1e9,
	T = 1e12,
	Qa = 1e15,
	Qi = 1e18,
	Sx = 1e21,
	Sp = 1e24,
	Oc = 1e27,
	No = 1e30,
	Dc = 1e33,
}

--[=[
    Expands an abbreviated number to it literal value.

    ```luau
    local abbreviated = "6.69K"
    local number = expand(abbreviated)
	
    print(number) -- 6969
    ```

    @param abbreviated string

    @return The expanded number
]=]
return function(abbreviated: string): number
	local number = tonumber(abbreviated)
	if number then
		return number
	end

	local value, suffix = abbreviated:match("([%d%.]+)(%a+)")
	if value and suffix and multipliers[suffix:upper()] then
		return tonumber(value) * multipliers[suffix:upper()]
	end

	return 0
end