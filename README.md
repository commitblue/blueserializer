<h1 align="center">blueserializer</h1>
<div align="center">A serializer written so you dont have to make one yourself.</div>
<div>&nbsp;</div>

# Why.
Roblox primitive types are a thing, We use it regularly and alot, even if you didn't know. and the issue with it is that..
1. You cant save it to datastores
2. You cant transfer them through remotes
Writing your serializers is just pain. So I wrote this package just for the purpose of
Serializing roblox's primitive types to make them supported for these.
## Supported primitive types (so far)

| Supported primitive types |
|---------------------------|
| CFrame                    |
| Vector3                   |
| Color3                    |
| EnumItem                  |
| BrickColor                |
| TweenInfo                 |
| Vector2                   |
| Vector2int16              |
| Vector3int16              |

(note that ill probably not update this list frequently but to get the latest list,
read serializerList.lua inside the module folder)

## Small examples

```lua
local blueSerializer = require(path.to.blueserializer)
local serialized = blueSerializer.serialize(Vector3.new(1, 5, 88))
print(serialized) -- >> {"V", 1, 5, 88}
print(blueSerializer.deserialize(serialized)) -- >> Vector3.new(1, 5, 88) or in the output 1, 5, 88
-- blueSerialize.deSerialize exists as an alias of blueSerializer.deserialize
```

## Some things to note
Default.project.json should be ignored. I only added it for the autofill
This is not the most optimized way to serialize.