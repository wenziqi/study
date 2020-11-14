local type= type

local type_nil = type(nil)
local type_boolean = type(true)
local type_number = type(0)
local type_string = type("")
local type_table = type({})
local type_function = type(function() end)
local type_thread = type(coroutine.create(function() end))
local type_userdata = "userdata"

local types =  {
	type_nil = type_nil,
	type_boolean = type_boolean,
	type_number = type_number,
	type_string = type_string,
	type_table = type_table,
	type_function = type_function,
	type_thread = type_thread,
	type_userdata = type_userdata,

	is_table = function(t) return type(t)==type_table end,
	is_number = function(n) return type(n)==type_number end,
	is_string = function(s) return type(s)==type_string end,
	is_thread = function(t) return type(t)==type_thread end,
	is_userdata = function(t) return type(t)==type_userdata end,
}

return types

