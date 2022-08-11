AI = {}

function AI:load() 
  self.height = 100
  self.width = 20
  self.x = love.graphics.getWidth() - 20 * 2
  self.y = ( love.graphics.getHeight() - self.height ) / 2
  self.speed = 500
  self.yVel = 0
  self.rate = 0.3
  self.timer = 0
end

function AI:update(dt) 
  AI:move(dt)
  self.timer = self.timer + dt
  if self.timer > self.rate then
    self.timer = 0
    AI:AI()
  end
end

function AI:draw() 
  love.graphics.setColor( rgb(216, 222, 233, 1))
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function AI:move(dt)
  self.y = self.y + ( self.yVel * dt )
end

function AI:AI()
  if ( Ball.y + Ball.height ) < self.y then 
    self.yVel = -( self.speed )
  elseif Ball.y > ( self.y + self.height ) then 
    self.yVel = self.speed
  else 
    self.yVel = 0
  end
end
