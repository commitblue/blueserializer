local serializerList = require(script.serializerList)
local module = {}
function module.serialize(value) : table
    local valueTypeOf = typeof(value)
    local valueIdFound = serializerList.valueIds[valueTypeOf]
    if valueIdFound then
        return serializerList.serializers[valueTypeOf](value)
    end
    return value
end
function module.deserialize(value : table)
    -- TODO: Optimize this
    for i,v in serializerList.valueIds do
        if v == value[1] then
            return serializerList.deserializers[i](value)
        end
    end
    return value
end
module.deSerialize = module.deserialize
return module