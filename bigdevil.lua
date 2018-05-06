
local bigdevilspawnref=100

bdframes={
	loadfilter("bigdevil/bd1.png"),
	loadfilter("bigdevil/bd2.png"),
	loadfilter("bigdevil/bd3.png"),
}






function bdevilbhv(b,i)
	b.pic=bdframes[animstep]
	
	b.cy=b.cy+b.yspeed
	
	if b.cy> pfh-b.hbx.h/2 then
	 b.yspeed=-1
	end
	
	if b.cy<b.hbx.h/2 then 
	 b.yspeed=1
	end
	
	if b.tspawn== 0 then
	    print(" bd spawn ")
		b.tspawn=bigdevilspawnref
		
		if b.spawndir=='right' then
			-- print('left')
			table.insert(
				curscreen.gos,
				createdevil(b.cx/pfw,b.cy/pfh,1,1)
				)
			table.insert(
				curscreen.gos,
				createdevil(b.cx/pfw,b.cy/pfh,1,-1)
				)
		end
		
		if b.spawndir=='left' then
			-- print('right')
			table.insert(
				curscreen.gos,
				createdevil(b.cx/pfw,b.cy/pfh,-1,-1)
				)
			table.insert(
				curscreen.gos,
				createdevil(b.cx/pfw,b.cy/pfh,-1,1)
				)
		end
	else
		b.tspawn=b.tspawn-1
	end


	
	--TODO maybe make it particular
    if (watersplash(i,b) )then
	
		--todo effector for wobble?
		b.zoom=b.zoom-0.02
		rankcounter=rankcounter-0.5
	end
	
	
	refreshxyfromzoom(b)
	
	if b.zoom<=0 then
		table.remove(curscreen.gos,i)
	end
	
end

function createbigdevil(pcx,pcy,yspeed,spawndir)
	ret={}
	ret.pic=bdframes[1]
	ret.cx=pfw*pcx
	-- -ret.pic:getData():getWidth()/2
	ret.cy=pfh*pcy
	-- -ret.pic:getData():getHeight()/2
	-- ret.blocking=true
	ret.picdata=ret.pic:getData()
	ret.hbx=computebox(0,ret.pic:getData(),1)
	ret.blockvictory=true
	ret.tspawn=bigdevilspawnref
	ret.zoom=1
	ret.yspeed=yspeed
	ret.spawndir=spawndir
	refreshxyfromzoom(ret)
	
	ret.bfunc=bdevilbhv
	print("big devil at "..ret.x.." "..ret.y)
	return ret
end