--TODO stun fireman when touched ? DEFINITELY

local firstbhvtimer=120

local plytargetcycles=240

local vframes={
	loadfilter("snake/down1.png"),
	loadfilter("snake/down2.png"),
	loadfilter("snake/down3.png"),
}

local hframes={
	loadfilter("snake/right1.png"),
	loadfilter("snake/right2.png"),
	loadfilter("snake/right3.png"),
}



--WIP EITHER LEFT RIGHT OR UP DOWN ( tune constructor )
local hseqs= {
	{x=1,y=0},
	-- {x=0,y=1},
	{x=-1,y=0},
	-- {x=0,y=-1},
}

local vseqs= {
	{x=0,y=1},
	-- {x=0,y=1},
	{x=0,y=-1},
	-- {x=0,y=-1},
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
	
	b.pic=b.frames[animstep]
	
	tx=b.zx+b.vx*2 --safe margin for bug
	ty=b.zy+b.vy*2 --safe margin for bug
	
	b.step=b.step-1
	
	if stepofpf(tx,ty,b.picdata:getWidth(),b.picdata:getHeight()) 
	or wallcoll(tx,ty,b.hbx,curscreen) 
	or b.step<=0 then
		 -- b.vx=-b.vx
		 -- b.vy=-b.vy
		 b.seqnum=b.seqnum+1
		if b.seqnum>2 then b.seqnum=1 end
		b.vx=b.seq[b.seqnum].x
		b.vy=b.seq[b.seqnum].y
		print('seq change'..b.vx..' '..b.vy)
		b.step=200

		--for debug 
		-- table.insert(
			-- curscreen.gos,
			-- createfire(b.cx/pfw,b.cy/pfh,0.4,bluefireframes,true)
		-- )

		
		
		-- return
	else
	 b.cx=b.cx+b.vx
	 b.cy=b.cy+b.vy
	end
	wateronburning(i,b)
	refreshxyfromzoom(b)
end



--todo add sequence as param ( hori and vert snakes )
function createsnake(pcx,pcy,seqnum,seq,frames)
	ret={}
	ret.blockvictory=true
	ret.seq=seq
	ret.frames=frames
	ret.pic=ret.frames[1]
	ret.cx=pfw*pcx
	ret.cy=pfh*pcy
	print(ret.seq)
	ret.vx=ret.seq[seqnum].x
	ret.vy=ret.seq[seqnum].y
	ret.seqnum=seqnum
	ret.step=200
	--if we use zoom we shall also use picdata,
	--but could be refac to w h
	ret.zoom=1
	ret.picdata=ret.pic.data

	
	refreshxyfromzoom(ret)
	
	ret.bfunc=negfirstbhv
	ret.timer=firstbhvtimer
	print("snake at "..ret.x.." "..ret.y)
	return ret
end

--lets create from zazanim file analysis
function createsnks(addhere,boxlist)

	for i,v in ipairs(boxlist)
	do
		print("program create nb")
		bfx=v.minx+(v.maxx-v.minx)/2
		bfy=v.miny+(v.maxy-v.miny)/2
		table.insert(
			addhere,
			createsnake(bfx/pfw,bfy/pfh,1,vseqs,vframes)
			)
	end
end

function createhsnks(addhere,boxlist)

	for i,v in ipairs(boxlist)
	do
		print("program create nb")
		bfx=v.minx+(v.maxx-v.minx)/2
		bfy=v.miny+(v.maxy-v.miny)/2
		table.insert(
			addhere,
			createsnake(bfx/pfw,bfy/pfh,1,hseqs,hframes)
			)
	end
end
