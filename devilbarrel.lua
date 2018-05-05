--TODO stun fireman when touched ?

local dbspawnref=120

dbarrelframes={
	loadfilter("dbarrel/db1.png"),
}

function dbarbhv(b,i)
	b.pic=dbarrelframes[1]
	
	if b.tspawn== 0 then
		b.tspawn=dbspawnref
		
		table.insert(
			curscreen.gos,
			createdevil(0.5,0.5,1,1)
			)
	else
		b.tspawn=b.tspawn-1
	end
end

function createdbarrel(pcx,pcy)
	ret={}
	ret.pic=dbarrelframes[1]
	ret.x=pfw*pcx-ret.pic:getData():getWidth()/2
	ret.y=pfh*pcy-ret.pic:getData():getHeight()/2
	ret.blocking=true
	ret.hbx=computebox(0,ret.pic:getData(),1)
	
	ret.tspawn=dbspawnref
	
	ret.bfunc=dbarbhv
	print("dbarrel at "..ret.x.." "..ret.y)
	return ret
end