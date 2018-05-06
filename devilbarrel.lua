
local dbspawnref=100

dbarrelframes={
	loadfilter("dbarrel/db1.png"),
	loadfilter("dbarrel/db2.png"),
	loadfilter("dbarrel/db3.png"),
}



--check collision of water drops with objects
--if coll removes water drop, returns true
function watersplash(i,f)
	for j,b in pairs(bullets) 
	do
	 if(collhbs(b.x,b.y,b.hbx,f.zx,f.zy,f.hbx)) then
	  table.remove(bullets,j)
	  return true
	 end
	end
end



function dbarbhv(b,i)
	b.pic=dbarrelframes[animstep]
	
	
	
	
	if b.tspawn== 0 then
		b.tspawn=dbspawnref
		
		table.insert(
			curscreen.gos,
			createdevil(0.5,0.5,1,1)
			)
		table.insert(
			curscreen.gos,
			createdevil(0.5,0.5,-1,-1)
			)
		table.insert(
			curscreen.gos,
			createdevil(0.5,0.5,1,-1)
			)
		table.insert(
			curscreen.gos,
			createdevil(0.5,0.5,-1,1)
			)
	else
		b.tspawn=b.tspawn-1
	end


	
	--TODO maybe make it particular
    if (watersplash(i,b) )then
	
		--todo effector for wobble?
		b.zoom=b.zoom-0.02
	end
	
	
	refreshxyfromzoom(b)
	
	if b.zoom<=0 then
		table.remove(curscreen.gos,i)
	end
	
end

function createdbarrel(pcx,pcy)
	ret={}
	ret.pic=dbarrelframes[1]
	ret.cx=pfw*pcx
	-- -ret.pic:getData():getWidth()/2
	ret.cy=pfh*pcy
	-- -ret.pic:getData():getHeight()/2
	-- ret.blocking=true
	ret.picdata=ret.pic:getData()
	ret.hbx=computebox(0,ret.pic:getData(),1)
	ret.blockvictory=true
	ret.tspawn=dbspawnref
	ret.zoom=1
	
	refreshxyfromzoom(ret)
	
	ret.bfunc=dbarbhv
	print("dbarrel at "..ret.x.." "..ret.y)
	return ret
end