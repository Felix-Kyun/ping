--  vim:fileencoding=utf-8:foldmethod=marker
--[[
  Name    : Ping Pong 
  Made by : Felix Kyun 
  Mail    : iamfelixkyun@gmail.com
  Github  : Felix_Kyun
  Lang    : lua
]]

-- {{{ require 
require("player")     -- Player Module 
require("ball")       -- Ball Module
require("ai")         -- AI Module
require("fps")        -- Fps Module
require("score")      -- Score Module
--}}}

-- {{{ Love.load 
function love.load() 
  Player:load()
  Ball:load()
  AI:load()
  Fps:load()
  Score:load()
  font = love.graphics.newFont(20)
end
-- }}}

-- {{{ Love.update 
function love.update(dt) 
  Player:update(dt)
  Ball:update(dt)
  AI:update(dt)
  Score:update(dt)
  Fps:update(dt)
end
-- }}}

-- {{{ Love.draw 
function love.draw() 
  love.graphics.setBackgroundColor( rgb(46, 52, 64, 1) )
  love.graphics.setFont(font)
  Player:draw()
  Ball:draw()
  AI:draw()
  Score:draw()
  Fps:draw()
end
-- }}}

-- {{{Function 

function rgb(r, g, b, a)
  return {
    r/255,
    g/255,
    b/255,
    a
  }
end


-- }}}
