local abbreviate = require(script.abbreviate)
local expand = require(script.expand)
local formatCurrency = require(script.formatCurrency)
local formatTime = require(script.formatTime)
local round = require(script.round)

--[=[
    A Library for math related utility functions.
]=]
return {
	abbreviate = abbreviate,
	expand = expand,
	formatCurrency = formatCurrency,
	formatTime = formatTime,
	round = round,
}
