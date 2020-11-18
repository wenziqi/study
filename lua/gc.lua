-- @desc gc封装
-- @auth rocky
-- @date 2020-11-18

local gc = {}
local collectgarbage = collectgarbage

function gc.Start()
	collectgarbage("restart")
end

function gc.Stop()
	collectgarbage("stop")
end

function gc.Collect()
	collectgarbage("collect")
end

function gc.Count()
	return collectgarbage("count")
end


function gc.Step()
	collectgarbage("step")
end

function gc.SetPause()
	collectgarbage("setpause")
end

function gc.SetStepMul()
	collectgarbage("setstepmul")
end


return gc
