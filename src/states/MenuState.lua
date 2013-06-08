require("src/util/helper")
require("src/util/gamestate")

MenuState = class("MenuState", GameState)

function MenuState:__init()
    self.menupoints = {"Credits","Play","Exit"}
    self.index = 1
    self.runner = 0
    self.runner2 = 0
    self.font = resources.fonts.big
end

function MenuState:start()
	love.graphics.setFont(resources.fonts.big)
end

function MenuState:update(dt)
	self.runner = self.runner + dt/10
    if self.runner > 0.1 then
        self.runner = -0.1
    end
    love.timer.sleep(0.05)
    self.wobble = 1 + math.abs(self.runner)
    self.runner2 = self.runner2 + dt/7
    if self.runner2 > 0.1 then
        self.runner2 = -0.1
    end
    self.yscale = 1 + math.abs(self.runner2)

    local mousex, mousey = love.mouse.getPosition()
    if (mousey > 450 ) and (mousey < 500) then
        if (mousex > 1) and (mousex < 1) then
            self.index = 1
        end
    end
end

function 
	MenuState:draw()love.graphics.setColor(255, 255, 255)
    --love.graphics.draw(resources.images.arena)

    for i = 1, 3, 1 do
        local scale = 1
        local text = self.menupoints[i]
        local x = i*(love.graphics.getWidth()/4)
        if (i-1) == self.index then
            scale = self.wobble
        else
            scale = self.wobble*0.8
        end
        love.graphics.print(text, x, 450, 0, scale-0.25, scale, self.font:getWidth(text)/2, self.font:getHeight(text)/2)
    end
end

function MenuState:keypressed(key, u)
    if key == "right" or key ==  "d" then
        if self.index < 2 then
            self.index = self.index + 1
        elseif self.index == 2 then
            self.index = 0
        end
    elseif key == "left" or key == "a" then
        if self.index > 0 then
            self.index = self.index -1
        elseif self.index == 0 then
            self.index = 2
        end
    elseif key == "return" then
        if self.index == 0 then

        elseif self.index == 1 then
            stack:push(LevelOne)
        elseif self.index == 2 then
            love.event.push("quit")
        end
    end
end