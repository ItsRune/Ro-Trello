local HttpService = game:GetService("HttpService")

local Request = {}
local Class = {}
Class.__index = Class

--// Request Functions \\--
function Request.new(url : string) : {any}
    local self = setmetatable({}, Class)
    
    self._url = url;

    return self
end

--// Class Functions \\--
function Class:_request(Method : string, Data : {any}) : {any}?
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = self._url;
            Method = "GET";
        })
    end)

    if success then
        return response
    end
    return nil
end

function Class:Post(Data : {any}) : {any}?
    return self:_request("POST", Data)
end

function Class:Get() : {any}?
    return self:_request("GET")
end

return Request