
fireframes={
	loadfilter("fire/fire1.png"),
	loadfilter("fire/fire2.png"),
	loadfilter("fire/fire3.png")
}

function changezoomadjustcoords(f,z)

 	  f.zoom=f.zoom+z
	  refreshxyfromzoom(f)
end

function firebehavior(f,i)

	rankcounter=rankcounter+livingfirebonus

	f.pic=fireframes[animstep]
	if fireinctimer==1 then
	 if f.zoom <=maxfirezoom then
      f.zoom=f.zoom+firezoominc
  	  refreshxyfromzoom(f)
	 end
	end
	
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
	end
	
	-- if f.childinhib>0 then
	 -- f.childinhib=f.childinhib-1
	-- end
	
	-- if f.zoom>firestep and f.childinhib==0 and f.hasspawned== false then
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
	 -- table.insert(
	 -- curscreen.gos,
	 -- createfire((f.cx)/pfw,(f.cy-64)/pfh,0.2)
	 -- )
	 -- print("FIRE SPAWNED")
	 -- f.childinhib=childinhibcycles
	 -- f.hasspawned=true
	-- end
	
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
function createfire(pcx,pcy,zoom)
	if zoom==nil then
	 zoom=0.5
	end

	ret={}
	ret.hasspawned=false
	ret.childinhib=0
	ret.blockvictory=true
	ret.zoom=zoom
	ret.pic=fireframes[1]
	ret.picdata=fireframes[1]
	--center 
	ret.cx=pcx*pfw
	ret.cy=pcy*pfh
	-- print("")
	refreshxyfromzoom(ret)
	ret.bfunc=firebehavior
	print("fire at "..ret.x.." "..ret.y)
	return ret
end

