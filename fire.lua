
fireframes={
	loadfilter("fire/fire1.png"),
	loadfilter("fire/fire2.png"),
	loadfilter("fire/fire3.png")
}

bluefireframes={
	loadfilter("bluefire/bf1.png"),
	loadfilter("bluefire/bf2.png"),
	loadfilter("bluefire/bf3.png")
}


function changezoomadjustcoords(f,z)

 	  f.zoom=f.zoom+z
	  refreshxyfromzoom(f)
end

--TODO refactor with callback?	 
--this is for fire
function wateronburning(i,f)
	--collision water with fire 
	for j,b in pairs(bullets) 
	do
	 if(collhbs(b.x,b.y,b.hbx,f.zx,f.zy,f.hbx)) then
	  table.remove(bullets,j)
	  if rankcounter>0 then
		rankcounter=rankcounter-waterreward
	  end
	  changezoomadjustcoords(f,waterzoominc )
	 end
	end
	
	if f.zoom<=minfirezoom then
	 table.insert(curscreen.gos,createfx(f.cx/pfw,f.cy/pfh,smokeframes))
 	 table.remove(curscreen.gos,i)
	 love.audio.play(extinction)
	 return true --to chain further
	end


end


function firebehavior(f,i)

	rankcounter=rankcounter+livingfirebonus

	f.pic=f.frames[animstep]
	if fireinctimer==1 then
	 if f.zoom <=maxfirezoom then
      f.zoom=f.zoom+firezoominc
  	  refreshxyfromzoom(f)
	 end
	end
	
	
	wateronburning(i,f)
	-- --collision water with fire 
	-- for j,b in pairs(bullets) 
	-- do
	 -- if(collhbs(b.x,b.y,b.hbx,f.zx,f.zy,f.hbx)) then
	  -- table.remove(bullets,j)
	  -- if rankcounter>0 then
		-- rankcounter=rankcounter-waterreward
	  -- end
	  -- changezoomadjustcoords(f,waterzoominc )
	 -- end
	-- end
	
	-- if f.zoom<=minfirezoom then
	 -- table.insert(curscreen.gos,createfx(f.cx/pfw,f.cy/pfh,smokeframes))
 	 -- table.remove(curscreen.gos,i)
	 -- love.audio.play(extinction)
	-- end

	if f.spawn==true then
		print('ticking blue fire')
		if f.childinhib>0 then
		 f.childinhib=f.childinhib-1
		end
		
		if f.zoom>firestep and f.childinhib==0 and f.hasspawned== false then
		 -- table.insert(
		 -- curscreen.gos,
		 -- createfire((f.cx-64)/pfw,f.cy/pfh,0.2)
		 -- )
		 -- table.insert(
		 -- curscreen.gos,
		 -- createfire((f.cx+64)/pfw,f.cy/pfh,0.2)
		 -- )
		 -- table.insert(
		 -- curscreen.gos,
		 -- createfire((f.cx)/pfw,(f.cy+64)/pfh,0.2)
		 -- )
		 table.insert(
		 curscreen.gos,
		 createfire((f.cx+f.xspawn*32)/pfw,(f.cy+f.yspawn*32)/pfh,0.4,bluefireframes,true)
		 )
		 print("FIRE SPAWNED")
		 f.childinhib=childinhibcycles
		 
		 -- let's not block respawn of blue fire
		 f.hasspawned=true
		end
	end
	
	if collhbs(ply.x,ply.y,ply.hbx,f.x,f.y,f.hbx) then
		print("coll fire !!!!!!!!!!!!!!")
		--maybe spawn fireman
		table.insert(curscreen.gos,createfx(f.cx/pfw,f.cy/pfh,flareframes))
		table.remove(curscreen.gos,i)
		-- table.insert(curscreen.gos,createfire(b.cx/pfw,b.cy/pfh))
		love.audio.stop(rankup)
		love.audio.play(rankup)
		rankcounter=rankcounter+1
	end
end

--handles zoom from center coordinates
function refreshxyfromzoom(f)
	--upper left of ZOOM 1 version
	f.x=f.cx-(f.picdata:getWidth()/2)
	f.y=f.cy-(f.picdata:getHeight()/2)
	--upper left of current zoom version
	f.zx=f.x+(f.picdata:getWidth()-f.picdata:getWidth()*f.zoom)/2
	f.zy=f.y+(f.picdata:getHeight()-f.picdata:getHeight()*f.zoom)/2
	f.hbx=computebox(0,f.picdata,f.zoom)
end

--takes percent of screen between 0 and 1
function createfire(pcx,pcy,zoom,frames,spawn)
	if zoom==nil then
	 zoom=0.5
	end

	ret={}


	if frames==nil then
	 ret.frames=fireframes
	else
	 ret.frames=frames
	end
	ret.hasspawned=false
	ret.childinhib=0

	ret.blockvictory=true
	ret.zoom=zoom
	
	ret.pic=ret.frames[1]
	ret.picdata=ret.frames[1].data
	--center 
	ret.cx=pcx*pfw
	ret.cy=pcy*pfh
	
	if spawn==true then
		ret.spawn=true
		--determining spawn direction by looking where screen center is
		if pcx<0.5 then
			ret.xspawn=1
		else
			ret.xspawn=-1
		end
		if pcy<0.5 then
			ret.yspawn=1
		else
			ret.yspawn=-1
		end

	end
	
	
	-- print("")
	refreshxyfromzoom(ret)
	ret.bfunc=firebehavior
	print("fire at "..ret.x.." "..ret.y)
	return ret
end


--lets create from zazanim file analysis
function createbfs(addhere,boxlist)

	for i,v in ipairs(boxlist)
	do
		print("program create bf")
		bfx=v.minx+(v.maxx-v.minx)/2
		bfy=v.miny+(v.maxy-v.miny)/2
		table.insert(
			addhere,
			createfire(bfx/pfw,bfy/pfh,0.4,bluefireframes,true)
			)
	end
end

--lets create from zazanim file analysis
function createnfs(addhere,boxlist)

	for i,v in ipairs(boxlist)
	do
		print("program create nf")
		bfx=v.minx+(v.maxx-v.minx)/2
		bfy=v.miny+(v.maxy-v.miny)/2
		table.insert(
			addhere,
			createfire(bfx/pfw,bfy/pfh)
			)
	end
end