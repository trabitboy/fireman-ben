--TODO stun fireman when touched ?

local firstbhvtimer=120

local plytargetcycles=240

local negabenframes={
	loadfilter("negaben/down1.png"),
	loadfilter("negaben/down2.png"),
	loadfilter("negaben/down3.png"),
}




--WIP
local vseqs= {
	{x=1,y=0},
	{x=0,y=1},
	{x=-1,y=0},
	{x=0,y=-1},
}



local function negfirstbhv(b,i)
	-- b.timer=b.timer-1
	-- if b.timer==0 then
	 -- b.vx=(ply.x-b.cx)/plytargetcycles
	 -- b.vy=(ply.y-b.cy)/plytargetcycles
	 
   	 -- b.bfunc=negsecondbhv
	 -- return
	-- end

	print(b.zx ..' '..b.zy)
	
	b.pic=negabenframes[animstep]
	
	tx=b.zx+b.vx
	ty=b.zy+b.vy
	
	b.step=b.step-1
	
	if stepofpf(tx,ty,b.picdata:getWidth(),b.picdata:getHeight()) or wallcoll(tx,ty,b.hbx,curscreen) or b.step<=0 then
		 -- b.vx=-b.vx
		 -- b.vy=-b.vy
		 b.seqnum=b.seqnum+1
		if b.seqnum>4 then b.seqnum=1 end
		b.vx=vseqs[b.seqnum].x
		b.vy=vseqs[b.seqnum].y
		--TODO pb on coll , 2 seq changes in a row
		print('seq change'..b.vx..' '..b.vy)
		b.step=200
		table.insert(
			curscreen.gos,
			createfire(b.cx/pfw,b.cy/pfh,0.4,bluefireframes,true)
		)

		
		
		return
	else
	 b.cx=b.cx+b.vx
	 b.cy=b.cy+b.vy
	end
	wateronburning(i,b)
	refreshxyfromzoom(b)
end




function createnegaben(pcx,pcy,seqnum)
	ret={}
	ret.blockvictory=true
	
	ret.pic=negabenframes[1]
	ret.cx=pfw*pcx
	ret.cy=pfh*pcy
	ret.vx=vseqs[seqnum].x
	ret.vy=vseqs[seqnum].y
	ret.seqnum=seqnum
	ret.step=200
	--if we use zoom we shall also use picdata,
	--but could be refac to w h
	ret.zoom=1
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
