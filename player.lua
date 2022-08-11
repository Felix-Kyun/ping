Player = {} 

function Player:load()
  self.height = 100
  self.width = 20
  self.x = 20
  self.y = ( love.graphics.getHeight() - self.height ) / 2
  self.speed = 500
end

function Player:update(dt)
  Player:move(dt)
  Player:keepBounds()
end

function Player:draw()
  love.graphics.setColor( rgb(216, 222, 233, 1))
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
  if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    self.y = self.y - ( self.speed * dt)
  elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    self.y = self.y + ( self.speed * dt)
  end
end

function Player:keepBounds()
  if self.y < 0 then
    self.y = 0
  elseif ( self.y + self.height ) > love.graphics.getHeight() then
    self.y = (love.graphics.getHeight() - self.height)
  end
end
