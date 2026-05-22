--[=[
	@function formatTime
	@within MathUtils
	@param seconds number
	@param format ("Compact" | "Extended")?
	@return string

	Formats a number of seconds into a time string.

	```lua
	local seconds = 6969
	local compact = formatTime(seconds)
	local extended = formatTime(seconds, "Extended")

	print(compact) -- 01:56:09
	print(extended) -- 1h 56m 9s
	```
]=]
return function(seconds: number, format: ("Compact" | "Extended")?): string
	format = format or "Compact"
	seconds = math.max(0, math.floor(seconds))

	if format == "Compact" then
		local hours = math.floor(seconds / 3600)
		local minutes = math.floor((seconds % 3600) / 60)
		local secs = seconds % 60

		if hours > 0 then
			return string.format("%d:%02d:%02d", hours, minutes, secs)
		else
			return string.format("%02d:%02d", minutes, secs)
		end
	elseif format == "Extended" then
		local days = math.floor(seconds / 86400)
		local hours = math.floor((seconds % 86400) / 3600)
		local minutes = math.floor((seconds % 3600) / 60)
		local secs = seconds % 60

		local parts = {}

		if days > 0 then
			table.insert(parts, days .. "d")
		end
		if hours > 0 then
			table.insert(parts, hours .. "h")
		end
		if minutes > 0 then
			table.insert(parts, minutes .. "m")
		end

		if secs > 0 or #parts == 0 then
			table.insert(parts, secs .. "s")
		end

		return table.concat(parts, " ")
	else
		error(`Wrong format parameter "{format}"`)
	end
end
