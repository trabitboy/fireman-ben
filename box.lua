
boxframes={
	loadfilter("box/box1.png")
}

function bbhv(b,i)

	--box cancels water
	for j,w in ipairs(bullets)
	do
		if collhbs(w.x,w.y,w.boxhbx,b.x,b.y,b.hbx) then
			print("coll water box !!!!!!!!!!!!!!")
			-- table.insert(curscreen.gos,createfx(f.cx/pfw,f.cy/pfh,flareframes))
			table.remove(bullets,j)
			table.insert(curscreen.gos,createfx(w.cx/pfw,w.cy/pfh,splashframes))
			
			--TODO play spash sound?
		end
	 
	
	end
end




function createbox(pcx,pcy)
	ret={}
	ret.pic=boxframes[1]
	ret.x=pfw*pcx-ret.pic:getData():getWidth()/2
	ret.y=pfh*pcy-ret.pic:getData():getHeight()/2
	ret.blocking=true
	ret.hbx=computebox(0,ret.pic:getData(),1)
	
	
	ret.bfunc=bbhv
	print("box at "..ret.x.." "..ret.y)
	return ret
end