Fps = {}

function Fps:load()
  self.rate = 1
  self.time = 0
  self.fps = 0
end

function Fps:update(dt)
  self.time = self.time + dt
  if self.time > self.rate then 
    self.time = 0
    self.fps = ( 1 / dt )
  end
end

function Fps:draw()
  love.graphics.print(string.format("FPS: %.0f", self.fps), ( love.graphics.getWidth() / 2 ) - 40, 10)
end
