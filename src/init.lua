local Settings = {
    Key = "";
    Token = "";
}

local Trello = {}
local Class = {}
Class.__index = Class

--// Trello Functions \\--
function Trello.new() : {any}
    local self = setmetatable({}, Class)
    
    self._key = Settings.Key;
    self._token = Settings.Token;

    return self
end

--// Class Functions \\--


return Trello