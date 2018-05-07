
-- function checklvlup()
 -- if #gameobjs==0 and #evtbuffer==0 then
    -- print("next lvl")
	-- currentLvl=currentLvl+1
	-- startCurrLvl()
 -- end
-- end


function tickuprank()
 if tickupinhib>0 then
  tickupinhib=tickupinhib-1
 end

 if tickupinhib==0 and rankcounter>=0 then
  rankcounter=rankcounter+1
  print("RANK UP "..rankcounter)
  tickupinhib=tickupref
 end
end

function maintainglobrank()
 oldrank=rank
 if rankcounter>=seuil5 then
  rank=5
 elseif rankcounter>=seuil4 then
  rank=4
 elseif rankcounter>=seuil3 then
  rank=3
 elseif rankcounter>=seuil2 then
  rank=2
 else
  rank=1 
 end

 if rank>oldrank then
  love.audio.play(rankup)
 elseif rank<oldrank then
  love.audio.play(rankdown)
 
 
 end
end

-- function checkdeath()
 -- if ply.hp<=0 then
  -- love.audio.play(aie)
  -- drawfunc=drawgameover
  -- updatefunc=updategameover
 -- end
-- end

function tickanimstep()
 animclk=animclk+1

 if animclk>animchge then 
	animclk=0
	animstep=animstep+1
	if animstep>3 then
	 animstep=1
	end
	a5step=a5step+1
	if a5step>5 then
	 a5step=1
	end

 end 
end

function checkblockingcoll(tx,ty)
 for i,v in pairs(curscreen.gos) 
  do
   -- print("bhv")
   if v.blocking==true then
    ret= collhbs(tx,ty,ply.hbx,v.x,v.y,v.hbx)
	if ret == true then
	 print("BLOCKING COLL")
	 return true
	end
   end
  end
  
--walls
 if curscreen.walls~=nil then
	 for i,v in pairs(curscreen.walls) 
	  do
	   -- print("bhv")
	   -- if v.blocking==true then
		ret= coll(tx+ply.hbx.x,ty+ply.hbx.y,ply.hbx.w,ply.hbx.h,v.minx,v.miny,v.maxx-v.minx,v.maxy-v.miny)
		if ret == true then
		 print("BLOCKING WALL COLL")
		 return true
		end
	   end
	  -- end
  end


  
 return false

end


function updatelvlintro()
 introtimer=introtimer-1
 if introtimer==0 then
  updatefunc=updategame
 end
end

function updatelvloutro()
 outrotimer=outrotimer-1
 if outrotimer==0 then
  -- updatefunc=updategame
   lvlglob.current=lvlglob.current+1
   levels[lvlglob.current]()
   updatefunc=updatelvlintro
   return

 end
end

function updategame()
 -- feedbgifnecessary()
 -- checkdeath()
 
 
 
 
 tickuprank()
 maintainglobrank()
 tickanimstep()
 
 
  overlayopacity=rankcounter/28*255
 
  if rankcounter>=28 then
   lives=lives-1
   
   if lives==0 then
    initgameover()
    finalpic=gameover
    drawfunc=drawgameover
    updatefunc=updategameover
   else
    levels[lvlglob.current]()
    initlives()
    drawfunc=drawlives
    updatefunc=updatelives
  
   end
  end
 
 
 
 
 if to_apply ~=nil then
  for i,v in pairs(to_apply) 
  do
   -- print("bhv")
   -- v.behavior(v,i) 
   tx=tx+v.ox
   ty=ty+v.oy
   table.remove(to_apply,i)
  end
  
 
 end
 
 
 local tx=ply.x
 local ty=ply.y

 
 local bxdir,bydir
 bxdir=xdir
 bydir=ydir
 
 xdir=0
 ydir=0
 
 
 
 j=polljoy()

 firepressed = love.keyboard.isDown("space") or j.mainfire==true
 
 if love.keyboard.isDown("left") or love.keyboard.isDown("a") or j.left~=nil then
  if firepressed==false then
   tx=ply.x-plyspeed
  end
  xdir=-1
  facing="l"
 end
 if love.keyboard.isDown("right") or love.keyboard.isDown("d") or j.right~=nil then
  if firepressed==false then
   tx=ply.x+plyspeed
  end
  xdir=1
  facing="r"
 end
 if love.keyboard.isDown("up") or love.keyboard.isDown("w") or j.up~=nil then
  if firepressed==false then
   ty=ply.y-plyspeed
  end
  ydir=-1
  facing="u"
 end
 if love.keyboard.isDown("down") or love.keyboard.isDown("s") or j.down~=nil then
  if firepressed==false then
   ty=ply.y+plyspeed
  end
  ydir=1
  facing="d"
 end
 
 if xdir==0 and ydir==0 then
  xdir=bxdir
  ydir=bydir
 end
  
 if firepressed or fingertwoid~=nil or j.mainfire~=nil then
  fireBullet(ply.x,ply.y+ply.h/2)
  -- print("fire")
 end

 -- print("ply.w ")
 -- print(ply.w)
 if outofpf(tx,ty,ply.w,ply.h)==false and checkblockingcoll(tx,ty)==false then
  --nothing
  -- print("BLOCKING")
 -- else
  ply.x=tx
  ply.y=ty
 end
 
 for i,v in pairs(curscreen.gos) 
 do
  -- print("bhv")
  v.bfunc(v,i) 
  
 end
 
 
 if bulletinhib>0 then
  bulletinhib=bulletinhib-1
 end
 
 for i,v in pairs(bullets) 
 do
  -- print("bhv")
  v.behavior(v,i) 
 end
 
 
 --tick firezoom factor
 fireinctimer=fireinctimer+1
 if fireinctimer>=fireincchg then
  fireinctimer=0
 end
 
 if checkvictory() then
  if levels[lvlglob.current+1]~=nil then
   outrotimer=120
   updatefunc=updatelvloutro
  -- lvlglob.current=lvlglob.current+1
   -- levels[lvlglob.current]()
   -- return
  else
   gotovictory()
   return
  end
 end
end


function gotovictory()
   finalpic=victory
   initgameover()
   drawfunc=drawgameover
   updatefunc=updategameover

end