
local refti=10

intro={
	bg=loadfilter("intro/bgts.png"),
	truck={
		loadfilter("intro/t1ts.png"),
		loadfilter("intro/t2ts.png"),
		loadfilter("intro/t3ts.png"),
		loadfilter("intro/t4ts.png"),
		loadfilter("intro/t5ts.png"),
		loadfilter("intro/t6ts.png"),
		loadfilter("intro/t7ts.png"),
	}
}

function inittuto()
 tutowait=60

 truckstep=1
 truckinhib=refti
end

--starts at any level
function startgame(lnum)
  lvlglob.current=lnum
  score=0
  ply={}
  
  ply.refhb=fmanframes.down[1]
  
  ply.w=ply.refhb:getData():getWidth()
  ply.h=ply.refhb:getData():getHeight()
  ply.hbx=computebox(16,ply.refhb:getData(),1)
  print("loading p.w")
  print(ply.w)
  
  
  -- initlvl1()
  -- initlvl2()
  levels[lvlglob.current]()
  
  
  drawfunc=drawgame
  -- updatefunc=updategame
  updatefunc=updatelvlintro

end

function updatetuto()
 
 truckinhib=truckinhib-1
 if truckinhib<=0 then
  truckinhib=refti
  if intro.truck[truckstep+1]~=nil then
   truckstep=truckstep+1
  end
 end
 
 tickanimstep()

 if tutowait>0 then
	tutowait=tutowait-1
 else
 
	 j=polljoy()
	 
	 if love.keyboard.isDown("space")  or j.start~=nil  then
		startgame(1)
	 end
	 
	 if love.keyboard.isDown("2") then
		startgame(2)
	 end

	 if love.keyboard.isDown("3") then
		startgame(3)
	 end
	 
 end
end



function drawtuto()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.draw(intro.bg,0,0)
 love.graphics.draw(intro.truck[truckstep],0,0)
 -- love.graphics.push()
 -- love.graphics.scale(2, 2)   -- reduce everything by 50% in both X and Y coordinates
 -- -- love.graphics.print("Scaled text", 50, 50)
 -- love.graphics.printf("GO FOR IT BEN",10,50,300,"center")
 -- love.graphics.printf(" press ENTER to start ",0,80,300,"center")
 -- love.graphics.pop() 
 -- love.graphics.printf("GO FOR IT BEN",100,200,300,"center")
 -- love.graphics.printf("wasd/qsdz/cursor to move , SPACE to fire ",100,250,300,"center")
 -- love.graphics.printf("picking up food boosts ranks ",100,280,300,"center")
 -- love.graphics.printf("AND EXCITES ENNEMIES ",100,310,300,"center")
 -- love.graphics.printf("letting food pass by calms everyone ",100,330,300,"center")

 if tutowait==0 then
	-- print(animstep)
	love.graphics.draw(pbframes[animstep],cvsw-64,cvsh-64)
 end

 -- love.graphics.print("your score",200,300)
 -- love.graphics.print(score,200,400)
 rdrvscreen()
end 