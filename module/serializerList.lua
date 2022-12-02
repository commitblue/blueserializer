local serializerList = {
    serializers = {},
    deserializers = {},
    valueIds = {
        CFrame = "C",
        Vector3 = "V",
        Color3 = "C3",
        EnumItem = "E",
        BrickColor = "B",
        TweenInfo = "T",
        Vector2 = "V2",
        Vector2int16 = "V2i",
        Vector3int16 = "Vi"
    }
}
-- serializers (here goes garbage that took 213093912399123912993 minutez to write)
function serializerList.serializers.CFrame(value : CFrame)
    return {serializerList.valueIds.CFrame, value:GetComponents()}
end
function serializerList.serializers.Vector3(value : Vector3)
    return {serializerList.valueIds.Vector3, value.X, value.Y, value.Z} -- it has to be hard
end
function serializerList.serializers.Color3(value : Color3)
    return {serializerList.valueIds.Color3, value.R, value.G, value.B}
end
function serializerList.serializers.EnumItem(value : EnumItem)
    return {serializerList.valueIds.EnumItem, value.EnumType, value.Name}
end
function serializerList.serializers.BrickColor(value : BrickColor)
    return {serializerList.valueIds.BrickColor, value.Name}
end
function serializerList.serializers.TweenInfo(value : TweenInfo)
    return {serializerList.valueIds.TweenInfo, value.Time, value.EasingStyle, value.EasingDirection, value.RepeatCount, value.Reverses, value.DelayTime}
end
function serializerList.serializers.Vector2(value : Vector2)
    return {serializerList.valueIds.Vector2, value.X, value.Y}
end
function serializerList.serializers.Vector2int16(value : Vector2int16)
    return {serializerList.valueIds.Vector2int16, value.X, value.Y}
end
function serializerList.serializers.Vector3int16(value : Vector3int16)
    return {serializerList.valueIds.Vector3int16, value.X, value.Y, value.Z}
end
-- deserializers (Note these does NOT Check for the type of table's value, if you want it to, use init.lua)
function serializerList.deserializers.CFrame(value : table)
    return CFrame.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.Vector3(value : table)
    return Vector3.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.Color3(value : table)
    return Color3.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.EnumItem(value : table)
    return Enum[value[2]][value[3]]
end
function serializerList.deserializers.BrickColor(value : table)
    return BrickColor.new(value[2])
end
function serializerList.deserializers.TweenInfo(value : table)
    return TweenInfo.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.Vector2(value : table)
    return Vector2.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.Vector2int16(value : table)
    return Vector2int16.new(table.unpack(value, 2, #value))
end
function serializerList.deserializers.Vector3int16(value : table)
    return Vector3int16.new(table.unpack(value, 2, #value))
end
return serializerList