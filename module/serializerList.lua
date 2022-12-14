--!strict

local serializers = {}
local deserializers = {}
local valueIds = {
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

type serializedCFrame = {typeof(valueIds.CFrame) | number}
type serializedColor3 = {typeof(valueIds.Color3) | number}
type serializedEnumItem = {typeof(valueIds.EnumItem) | number}
type serializedBrickColor = {typeof(valueIds.BrickColor) | string}
type serializedTweenInfo = {typeof(valueIds.TweenInfo) | number | Enum.EasingStyle | Enum.EasingDirection | boolean}
type serializedVector2 = {typeof(valueIds.Vector2) | number}
type serializedVector3 = {typeof(valueIds.Vector3) | number}
type serializedVector2int16 = {typeof(valueIds.Vector2int16) | number}
type serializedVector3int16 = {typeof(valueIds.Vector3int16) | number}

-- serializers
function serializers.CFrame(cframe : CFrame): serializedCFrame
	return {valueIds.CFrame, cframe:GetComponents()}
end

function serializers.Color3(value : Color3): serializedColor3
	return {valueIds.Color3, value.R, value.G, value.B}
end

function serializers.EnumItem(value : EnumItem): serializedEnumItem
	return {valueIds.EnumItem, tostring(value.EnumType), value.Name}
end

function serializers.BrickColor(value : BrickColor): serializedBrickColor
	return {valueIds.BrickColor, value.Name}
end

function serializers.TweenInfo(value : TweenInfo): serializedTweenInfo
	return {valueIds.TweenInfo, value.Time, value.EasingStyle, value.EasingDirection, value.RepeatCount, value.Reverses, value.DelayTime}
end

function serializers.Vector2(value : Vector2): serializedVector2
	return {valueIds.Vector2, value.X, value.Y}
end

function serializers.Vector2int16(value : Vector2int16): serializedVector2int16
	return {valueIds.Vector2int16, value.X, value.Y}
end

function serializers.Vector3(vector3 : Vector3): serializedVector3
	return {valueIds.Vector3, vector3.X, vector3.Y, vector3.Z} -- it has to be hard
end

function serializers.Vector3int16(value : Vector3int16): serializedVector3int16
	return {valueIds.Vector3int16, value.X, value.Y, value.Z}
end

-- deserializers (Note these does NOT Check for the type of table's value, if you want it to, use init.lua)
function deserializers.CFrame(value : serializedCFrame)
	return CFrame.new(unpack(value, 2))
end

function deserializers.Vector3(value : serializedVector3)
	return Vector3.new(unpack(value, 2))
end

function deserializers.Color3(value : serializedColor3)
	return Color3.new(unpack(value, 2))
end

function deserializers.EnumItem(value : serializedEnumItem)
	return Enum[value[2]][value[3]]
end

function deserializers.BrickColor(value : serializedBrickColor)
	return BrickColor.new(value[2])
end

function deserializers.TweenInfo(value : serializedTweenInfo)
	return TweenInfo.new(unpack(value, 2))
end

function deserializers.Vector2(value : serializedVector2)
	return Vector2.new(unpack(value, 2))
end

function deserializers.Vector2int16(value : serializedVector2int16)
	return Vector2int16.new(unpack(value, 2))
end

function deserializers.Vector3int16(value : serializedVector3int16)
	return Vector3int16.new(unpack(value, 2))
end

return table.freeze({
	serializers = table.freeze(serializers),
	deserializers = table.freeze(deserializers),
	valueIds = table.freeze(valueIds)
})
