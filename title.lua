function drawtitle()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.draw(title,0,0)
 -- love.graphics.printf( text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky )

 -- love.graphics.printf("Danmaku Burp",20,20,10,"center",0,4,4,0,0,0,0)
 love.graphics.print("press SPACE",200,600)
 rdrvscreen()
end

function updatetitle()
 -- touch=false

 -- ts = love.touch.getTouches()
 -- for i,v in pairs(ts) 
 -- do
  -- -- print(v)
  -- local x,y=love.touch.getPosition(v)
  -- if x ~=nil and y~=nil then
   -- print(x)
   -- print(y)
   -- touch = true
  -- end
  
 -- end
 -- print(ts)
 -- touchx,touchy=love.touch.getPosition(1)
 -- if touchx ~=nil and touchy~=nil then
  -- print(x)
  -- print(y)
 -- end


 if love.keyboard.isDown("space") or fingeroneid~=nil then
  drawfunc=drawtuto
  updatefunc=updatetuto
 end
end
