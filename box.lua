
boxframes={
	loadfilter("box/box1.png")
}

function bbhv(b,i)
	
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