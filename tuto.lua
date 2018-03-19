

function updatetuto()
 
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

 if love.keyboard.isDown("return") or  fingeroneid~=nil  then
   -- initlvl1()
  -- initGlobLvl()
  -- startCurrLvl()
  -- to_apply={}
  -- px=100
  -- py=100
  score=0
  ply={}
  
  -- ply.pic=devil
  -- ply.picdata=fmanframes[1]:getData()
  -- print(fmanframes1)
  ply.refhb=fmanframes.down[1]
  
  ply.w=ply.refhb:getData():getWidth()
  ply.h=ply.refhb:getData():getHeight()
  ply.hbx=computebox(8,ply.refhb:getData(),1)
  print("loading p.w")
  print(ply.w)
  
  overlayopacity=0
  
  rank=1
  rankcounter=0

  
  
  -- ply.x=100
  -- ply.y=100
  -- ply.w=fmanframes[1]:getData():getWidth()
  -- ply.h=fmanframes[1]:getData():getHeight()
  
  gameobjs={}
  bullets ={}
  tickupinhib=60
  bulletinhib=0
  
  initlvl1()
  
  drawfunc=drawgame
  updatefunc=updategame
 end
end



function drawtuto()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.push()
 love.graphics.scale(2, 2)   -- reduce everything by 50% in both X and Y coordinates
 -- love.graphics.print("Scaled text", 50, 50)
 love.graphics.printf("GO FOR IT BEN",10,50,300,"center")
 love.graphics.printf(" press ENTER to start ",0,80,300,"center")
 love.graphics.pop() 
 -- love.graphics.printf("GO FOR IT BEN",100,200,300,"center")
 -- love.graphics.printf("wasd/qsdz/cursor to move , SPACE to fire ",100,250,300,"center")
 -- love.graphics.printf("picking up food boosts ranks ",100,280,300,"center")
 -- love.graphics.printf("AND EXCITES ENNEMIES ",100,310,300,"center")
 -- love.graphics.printf("letting food pass by calms everyone ",100,330,300,"center")


 -- love.graphics.print("your score",200,300)
 -- love.graphics.print(score,200,400)
 rdrvscreen()
end 