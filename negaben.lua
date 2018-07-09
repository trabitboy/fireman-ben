--TODO stun fireman when touched ?

local firstbhvtimer=120

local plytargetcycles=240

local negabenframes={
	loadfilter("negaben/down1.png"),
	loadfilter("negaben/down2.png"),
	loadfilter("negaben/down3.png"),
}



local function negsecondbhv(b,i)

	b.pic=negabenframes[animstep]
	
	b.cx=b.cx+b.vx
	b.cy=b.cy+b.vy

	--not fully consistent but for clean up (you should be penalised)
	if outofpf(b.cx,b.cy,64,64) then
	 table.remove(curscreen.gos,i)
	 return
	end

	if collhbs(ply.x,ply.y,ply.hbx,b.x,b.y,b.hbx) then
		print("coll negaben !!!!!!!!!!!!!!")
		--maybe spawn fireman
		table.insert(curscreen.gos,createfx(b.cx/pfw,b.cy/pfh,flareframes))
		table.remove(curscreen.gos,i)
		table.insert(curscreen.gos,createfire(b.cx/pfw,b.cy/pfh))
		rankcounter=rankcounter+negabenhit
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

local function negfirstbhv(b,i)
	b.timer=b.timer-1
	if b.timer==0 then
	 b.vx=(ply.x-b.cx)/plytargetcycles
	 b.vy=(ply.y-b.cy)/plytargetcycles
	 
   	 b.bfunc=negsecondbhv
	 return
	end

	b.pic=negabenframes[animstep]
	
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

function createnegaben(pcx,pcy,ivx,ivy)
	ret={}
	ret.pic=negabenframes[1]
	ret.cx=pfw*pcx
	ret.cy=pfh*pcy
	ret.vx=ivx
	ret.vy=ivy

	--if we use zoom we shall also use picdata,
	--but could be refac to w h
	ret.zoom=0.75
	ret.picdata=ret.pic.data

	
	refreshxyfromzoom(ret)
	
	ret.bfunc=negfirstbhv
	ret.timer=firstbhvtimer
	print("negaben at "..ret.x.." "..ret.y)
	return ret
end

--lets create from zazanim file analysis
function createnbs(addhere,boxlist)

	for i,v in ipairs(boxlist)
	do
		print("program create nb")
		bfx=v.minx+(v.maxx-v.minx)/2
		bfy=v.miny+(v.maxy-v.miny)/2
		table.insert(
			addhere,
			createnegaben(bfx/pfw,bfy/pfh,1,1)
			)
	end
end
