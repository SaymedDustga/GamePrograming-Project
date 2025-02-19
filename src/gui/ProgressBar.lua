ProgressBar = Class{}

function ProgressBar:init(def)
    self.x = def.x
    self.y = def.y
    
    self.width = def.width
    self.height = def.height
    
    self.color = def.color

    self.value = def.value
    self.max = def.max

    self.showDetails = def.showDetails or false
    self.title = def.title or nil
end

function ProgressBar:setMax(max)
    self.max = max
end

function ProgressBar:setValue(value)
    self.value = value
end

function ProgressBar:setPosition(x,y)
    self.x = x
    self.y = y
end

function ProgressBar:update()


    
end

function ProgressBar:render()
    -- multiplier on width based on progress
    local renderWidth = (self.value / self.max) * self.width

    -- draw main bar, with calculated width based on value / max
    love.graphics.setColor(love.math.colorFromBytes(self.color.r, self.color.g, self.color.b, 255))
    
    if self.value > 0 then
        love.graphics.rectangle('fill', self.x, self.y, renderWidth, self.height, 3)
    end

    -- draw outline around actual bar
    love.graphics.setColor(love.math.colorFromBytes(0, 0, 0, 255))
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height, 3)
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255, 255))

    if self.showDetails then
        love.graphics.setFont(FONTS['small'])
        love.graphics.printf(self.value .. ' / ' .. self.max, self.x, self.y+self.height/4, self.width, 'center')
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 255, 255))
    end

    if self.title ~= nil then
        love.graphics.setFont(FONTS['small'])
        love.graphics.printf(self.title, self.x, self.y-8, self.width, 'left')
        love.graphics.setColor(love.math.colorFromBytes(255, 255, 255, 255))
    end
end
