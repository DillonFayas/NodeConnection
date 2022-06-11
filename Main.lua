local Connection1 = Instance.new('Part')
local Connection2 = Instance.new('Part')
-- Connections are the parts that need to be connected

function CreatePart()
	-- Instance [Part] has properties which can be manipulated in a 3D space.
	-- Properties are referenced/assigned using [Part.Property = Value]
	local newPart = Instance.new('Part')

	local n  = 1 -- Y and Z dimensions of instance -- Pre-determined in this case
	local x1 = Connection1.Position.X
	local x2 = Connection2.Position.X
	local y1 = Connection1.Position.Y
	local y2 = Connection2.Position.Y
	local z1 = Connection1.Position.Z
	local z2 = Connection2.Position.Z
	-- Define the positions for later reference

	local L =  math.abs((x1-x2)+(z1-z2))
	local Length = math.abs(L + (y2-y1))
	-- In this case, whether L is positive or negative doesn't matter

	if x2 - x1 < 0 and z2 - z1 > 0 then
		L = -L
	end
	-- Account for negative X values // When X is less than and not equal to 0

	if x2 - x1 < 0 and z2 - z1 < 0 then
		L = -L
	end
	-- Account for negative X values // When X is less than and not equal to 0

	local Angle  = -(math.deg(math.atan((z1-z2)/(x1-x2))))
	local AngleV = -(math.deg(math.atan((y1-y2)/L)))
	-- math.atan returns radians so math.deg is used to convert to degrees
	-- so dumb
	local PosX   = (x1+x2)/2
	local PosY   = (y1+y2)/2
	local PosZ   = (z1+z2)/2
	-- Pretty self-explanatory
	-- Just average the positions to get the center

	if x2 - x1 == 0 then
		AngleV = -AngleV
	end

	if x2 - x1 < 0 and z2 - z1 == 0 then
		AngleV = -AngleV
	end

	if x2 - x1 == 0 and z2 - z1 == 0 then
		Angle = 90
	end
	-- Very important | setting angles based on which quadrant the instance is in

	newPart.Size = Vector3.new(Length, n, n)
	newPart.Orientation = Vector3.new(0, Angle, AngleV)
	newPart.Position = Vector3.new(PosX, PosY, PosZ)

	return newPart
end

local Part = nil

while true do
	Part = CreatePart()
	wait()
	Part:Destroy()
end
