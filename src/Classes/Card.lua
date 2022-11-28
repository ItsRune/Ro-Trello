local Request = require(script.Parent.Parent:WaitForChild("Modules"):WaitForChild("Request"))

-- https://api.trello.com/1/cards/%s?key=%s&token=%s -- cardId, key, token
--[[
POST /1/cards - Create a new card on a List

PUT /1/cards/[card id or shortlink] - Update the contents of a Card

POST /1/cards/[card id or shortlink]/actions/comments - Add a comment to a Card

POST /1/cards/[card id or shortlink]/idMembers - Add a member to a Card
]]--

local cardRequest = Request.new("https://api.scryfall.com/cards/random")
local Card = {Cache = {}}
local Class = {}
Class.__index = Class

--// Card Functions \\--
function Card.new(id : string) : {any}
    local exists = Card.Cache[id]
    if exists then
        return exists
    end

    local self = setmetatable({}, Class)
    
    self._id = id;
    self._data = nil;

    Card.Cache[id] = self;
    return self
end

--// Class Functions \\--
function Class:Fetch() : {any}?
    
end

return Card