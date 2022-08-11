Score = {}

function Score:load()
  self.playerCurrentScore = 0
  self.playerMaxScore = 0
  self.aiCurrentScore = 0
  self.aiMaxScore = 0
  self.x = 10
  self.y = 10
end
 
function Score:update(dt)

  if self.playerCurrentScore > self.playerMaxScore then
    self.playerMaxScore = self.playerCurrentScore
  end

  if self.aiCurrentScore > self.aiMaxScore then
    self.aiMaxScore = self.aiCurrentScore
  end

end

function Score:draw()
  love.graphics.print(string.format("Current: %d \nMax: %d", self.playerCurrentScore, self.playerMaxScore ), self.x, self.y )
  love.graphics.print(string.format("Current: %d \nMax: %d", self.aiCurrentScore, self.aiMaxScore ), love.graphics.getWidth() - 150, self.y )
end

function Score:player()
  self.playerCurrentScore = self.playerCurrentScore + 10
end

function Score:ai()
  self.aiCurrentScore = self.aiCurrentScore + 10
end
