
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
 return false

end



function updategame()
 -- feedbgifnecessary()
 -- checkdeath()
 
 
 
 
 tickuprank()
 maintainglobrank()
 tickanimstep()
 -- checklvlup()
 --scroll faster with rank
 -- spawncounter=spawncounter+rank
 -- tickpanes()
 -- print(spawncounter)
 -- activation()
 
 
  overlayopacity=rankcounter/28*255
 
  if rankcounter>=28 then
   finalpic=gameover
   drawfunc=drawgameover
   updatefunc=updategameover
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
 if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
  tx=ply.x-plyspeed
  xdir=-1
  facing="l"
 end
 if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
  tx=ply.x+plyspeed
  xdir=1
  facing="r"
 end
 if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
  ty=ply.y-plyspeed
  ydir=-1
  facing="u"
 end
 if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
  ty=ply.y+plyspeed
  ydir=1
  facing="d"
 end
 
 if xdir==0 and ydir==0 then
  xdir=bxdir
  ydir=bydir
 end
  
 if love.keyboard.isDown("space") or fingertwoid~=nil then
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
 
 -- checkvictory() 
 if checkvictory() then
   finalpic=victory
   drawfunc=drawgameover
   updatefunc=updategameover
  -- updatefunc=updatevictory
  -- drawfunc=drawvictory
  return
 end
end
