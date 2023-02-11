local gears = require("gears")
local M = { }

function M.init(globals)
    gears.table.crush(M, globals)
end

return M
