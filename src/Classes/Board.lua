local Request = require(script.Parent.Parent:WaitForChild("Modules"):WaitForChild("Request"))

-- https://api.trello.com/1/boards/%s?key=%s&token=%s -- boardId, key, token
local boardRequest = Request.new("https://api.scryfall.com/cards/random")
local Board = {Cache = {}}
local Class = {}
Class.__index = Class

--// Board Functions \\--
function Board.new(id : string) : {any}
    local exists = Board.Cache[id]
    if exists then
        return exists
    end

    local self = setmetatable({}, Class)
    
    self._id = id;
    self._data = nil;
    self._cache = {};

    Board.Cache[id] = self;
    return self
end

--// Class Functions \\--
function Class:Fetch() : {any}?
    
end

function Class:Get(id : string) : {any}?
    local exists = self._cache[id]
    if exists then
        return exists
    end

    local response = boardRequest:Get()
    if response then
        self._cache[id] = response
        return response
    end
    return nil
end

return Board