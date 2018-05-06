waterframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("water/water1.png")
}

wupframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("water/waterup1.png")
}
wdownframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("water/waterdown1.png")
}
wleftframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("water/waterleft1.png")
}
wrightframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("water/waterright1.png")
}


function bulletBehavior(me,idx)
 me.x=me.x+me.vx*bulletspeed
 me.y=me.y+me.vy*bulletspeed

 
 updatecxcy(me)
 -- for i,v in pairs(gameobjs) 
 -- do 
  -- if v.hp~=nil then
   -- ret=collhbs(me.x,me.y,me.hbx,v.x,v.y,v.hbx)
   -- if ret then
    -- -- print(" bullet coll ")
   -- -- debug.debug()
    -- v.hp=v.hp-1
   
    -- table.remove(bullets,idx)
   -- end
  -- end
-- -- love.graphics.draw(ghost,pfx+v.x,pfy+v.y)
 -- end
 
 
 --TODO clean bullets out of screen
 if outofpf(me.x,me.y,b.picdata:getWidth(),b.picdata:getHeight()) then
  table.remove(bullets,idx)
  print("water erased")
 end
 
end

--not to generate constant stream
bulletinhib=0

function updatecxcy(b)
 	 b.cx=b.x+b.picdata:getWidth()/2
	 b.cy=b.y+b.picdata:getHeight()/2


end

function fireBullet(x,y)
 if bulletinhib==0 then

	 b={}
	 b.vx=xdir
	 b.vy=ydir
	 
	 --x axis has priority
	 if xdir==1 then
	  b.pic=wrightframes[1]
	 elseif xdir==-1 then
	  b.pic=wleftframes[1]
	 elseif ydir==-1 then
	  b.pic=wupframes[1]
	 elseif ydir==1 then
	  b.pic=wdownframes[1]
	 end
	 -- b.pic=waterframes[1]
	 b.picdata=b.pic:getData()
	 b.x=x-b.picdata:getWidth()/2+ply.w/2
	 b.y=y-b.picdata:getHeight()/2
	 b.hbx=computebox(0,b.picdata,1)
	 
	 b.boxhbx=computebox(15,b.picdata,1)
	 
	 b.behavior=bulletBehavior
	 table.insert(bullets,b)
	 love.audio.rewind(piou)
	 love.audio.play(piou)
	 bulletinhib=bulletinhibref
	 updatecxcy(b)
 end
end
