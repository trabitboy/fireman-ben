--TODO stun fireman when touched ?

local firstbhvtimer=120

local plytargetcycles=240

devilframes={
	loadfilter("devil/d1.png"),
	loadfilter("devil/d2.png"),
	loadfilter("devil/d3.png"),
	loadfilter("devil/d4.png"),
	loadfilter("devil/d1.png"),
}

flareframes={
	loadfilter("dflare/df1.png"),
	loadfilter("dflare/df2.png"),
	loadfilter("dflare/df3.png"),
	loadfilter("dflare/df4.png"),
	loadfilter("dflare/df5.png"),
}


function devsecondbhv(b,i)

	b.pic=devilframes[a5step]
	
	b.cx=b.cx+b.vx
	b.cy=b.cy+b.vy

	--not fully consistent but for clean up (you should be penalised)
	if outofpf(b.cx,b.cy,64,64) then
	 table.remove(curscreen.gos,i)
	 return
	end

	if collhbs(ply.x,ply.y,ply.hbx,b.x,b.y,b.hbx) then
		print("coll devil !!!!!!!!!!!!!!")
		--maybe spawn fireman
		table.insert(curscreen.gos,createfx(b.cx/pfw,b.cy/pfh,flareframes))
		table.remove(curscreen.gos,i)
		table.insert(curscreen.gos,createfire(b.cx/pfw,b.cy/pfh))

	end
	
	chain=wateronburning(i,b)
	if chain == true then
	 print("FLARE //")
	 --WIP doesnt show
	 -- createfx(b.cx/pfw,(b.cy-flareframes[1]:getData():getHeight()/2)/pfh,flareframes) -- stupid, needs to flare on touch
	 table.insert(curscreen.gos,createfx(b.cx/pfw,b.cy/pfh,flareframes)) -- stupid, needs to flare on touch
	end
	refreshxyfromzoom(b)
	
end

function devfirstbhv(b,i)
	b.timer=b.timer-1
	if b.timer==0 then
	 b.vx=(ply.x-b.cx)/plytargetcycles
	 b.vy=(ply.y-b.cy)/plytargetcycles
	 
   	 b.bfunc=devsecondbhv
	 return
	end

	b.pic=devilframes[a5step]
	
	tx=b.cx+b.vx
	ty=b.cy+b.vy
	
	if outofpf(tx,ty,64,64) then
	 return
	else
	 b.cx=tx
	 b.cy=ty
	end
	wateronburning(i,b)
	refreshxyfromzoom(b)
end

function createdevil(pcx,pcy,ivx,ivy)
	ret={}
	ret.pic=devilframes[1]
	ret.cx=pfw*pcx
	ret.cy=pfh*pcy
	ret.vx=ivx
	ret.vy=ivy

	--if we use zoom we shall also use picdata,
	--but could be refac to w h
	ret.zoom=0.75
	ret.picdata=ret.pic:getData()

	
	refreshxyfromzoom(ret)
	
	ret.bfunc=devfirstbhv
	ret.timer=firstbhvtimer
	print("devil at "..ret.x.." "..ret.y)
	return ret
end