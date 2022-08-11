Ball = {}

function Ball:load()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.height = 20
  self.width = 20
  self.speed = 400
  self.xVel = -( self.speed )
  self.yVel = 0
end

function Ball:update(dt)
  Ball:move(dt)
  Ball:deflect()
  Ball:inBound()
  Ball:Scored()
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width , self.height)
end

function Ball:move(dt) 
  self.x = self.x + ( self.xVel * dt )
  self.y = self.y + ( self.yVel * dt )
end

function Ball:collide( obj )
  if self.x < (obj.x + obj.width) and (self.x + self.width) > obj.x and obj.y < ( self.y + self.height ) and self.y < (obj.y + obj.height) then 
    return true 
  else 
    return false
  end
end

function Ball:getCollisionMultiplier( obj )
  return ( self.y + self.height / 2 ) - ( obj.y + obj.height / 2 )
end

function Ball:deflect()
  if Ball:collide(Player) then 
    self.xVel = self.speed 
    self.yVel = ( Ball:getCollisionMultiplier(Player) * 5 )
  elseif Ball:collide(AI) then 
    self.xVel = -( self.speed ) 
    self.yVel = ( Ball:getCollisionMultiplier(AI) * 5 )
  end
end

function Ball:inBound()
  if self.y < 0 then 
    self.y = 0
    self.yVel = -( self.yVel )
  elseif (self.y + self.height ) > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height 
    self.yVel = -( self.yVel )
  end
end

function Ball:Scored()
  if self.x < 0 then
    Ball:reset()
    Score:ai()
    self.xVel = self.speed
  end
  if ( self.x + self.width ) > love.graphics.getWidth() then 
    Ball:reset()
    Score:player()
    self.xVel = -( self.speed )
  end
end

function Ball:reset()
    self.x = ( love.graphics.getWidth() - self.width ) / 2
    self.y = ( love.graphics.getHeight() - self.height ) / 2
    self.yVel = 0
  end
