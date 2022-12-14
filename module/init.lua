--!strict

local module = {}

local serializerList = require(game.SoundService.Script.serializerList)

function module.serialize<value>(value) : {} | value
	local valueType = typeof(value)
	
	local serializer = serializerList.serializers[valueType]
	if serializer then
		return serializer(value)
	end
	
	return value
end

function module.deserialize<value>(value : {}) : value | {}
	local id = value[1]
	local deserializer = serializerList.deserializers[serializerList.idToType[id]]
	
	if deserializer then
		return deserializer(value)
	end
	
	return value
end

-- alias
module.deSerialize = module.deserialize

return module
