Shock = class("Shock")

function Shock:fire(force)


	if stack:current().limitshock == 0 and stack:current().mousetype == 1 then
		stack:current().feedback = true
		return
	elseif stack:current().mousetype == 1 then
		stack:current().limitshock = stack:current().limitshock - 1
		self.x = love.mouse.getX()
		self.y = love.mouse.getY()
		self.force = force * 800
		self.fireradius = 200

		shockeffect = Shockeffect(world, self.x, self.y, self.force, self.fireradius)

		table.insert(stack:current().shockeffect, shockeffect)

		for index, value in pairs(stack:current().el) do
			if (distance(value.body:getX(),value.body:getY(),self.x,self.y) < self.fireradius) then
				self.distancescale = (self.fireradius/(distance(value.body:getX(), value.body:getY(), self.x, self.y)))

				self.vectorlength = math.sqrt((value.body:getX()-self.x)^2 + (value.body:getY() - self.y)^2)
				self.xforce = (self.distancescale*self.force*((value.body:getX()-self.x)/self.vectorlength))
				if self.xforce > 800 then
					self.xforce = 800
				end
				if self.xforce < -800 then
					self.xforce = -800
				end
				self.yforce = (self.distancescale*self.force*((value.body:getY() - self.y)/self.vectorlength))
				if self.yforce > 800 then
					self.yforce = 800
				end
				if self.yforce < -800 then
					self.yforce = -800
				end
				value.body:applyForce(self.xforce, self.yforce)

			end
		end
		for index, value in pairs(stack:current().proton) do
			if (distance(value.body:getX(),value.body:getY(),self.x,self.y) < self.fireradius) then
				self.distancescale = (self.fireradius/(distance(value.body:getX(), value.body:getY(), self.x, self.y)))

				self.vectorlength = math.sqrt((value.body:getX()-self.x)^2 + (value.body:getY() - self.y)^2)
				self.xforce = (self.distancescale*self.force*((value.body:getX()-self.x)/self.vectorlength))
				if self.xforce > 800 then
					self.xforce = 800
				end
				if self.xforce < -800 then
					self.xforce = -800
				end
				self.yforce = (self.distancescale*self.force*((value.body:getY() - self.y)/self.vectorlength))
				if self.yforce > 800 then
					self.yforce = 800
				end
				if self.yforce < -800 then
					self.yforce = -800
				end
				value.body:applyForce(self.xforce, self.yforce)
			end
		end

	end
end