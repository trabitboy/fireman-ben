
--level globals
lvlglob={
	current=1,	

}

function globinit()
 --resets rank, etc
  overlayopacity=0
  
  rank=1
  rankcounter=0  
  gameobjs={}
  bullets ={}
  tickupinhib=60
  bulletinhib=0
 
  introtimer=60
end


--default gameplay init (from compo)
function dfltgplay()
	--gplay variables
	firezoominc=0.1
	minfirezoom=0.2
	maxfirezoom=3
	--amount zoom of fire is decreased on fire hit
	waterzoominc=-0.1
	--rank decrease when water splashes fire
	waterreward=1

	--zoom step to create new small fires
	firestep=0.5
	childinhibcycles=180

	fireinctimer=0
	fireincchg=120

	--number of cycles before automatic fire update
	tickupref=45
	livingfirebonus=0.01

end


-- lvl1=
function initlvl1()
  name="floor 1"

  dfltgplay()  
  globinit()
  
  ply.x=pfw/2
  ply.y=pfh/5
  require("level1.oneaw")
 onea={
	bg=love.graphics.newImage("level1/onea.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		createbox((1/4),(2/7)),
		createbox((3/4),(2/7)),
		createbox((1/4),(3/7)),
		createbox((3/4),(3/7)),
		createfire((1/5),(5/7)),
		createfire((4/5),(5/7)),
		-- createbox((1/2),(1/4)),
		createexit((1/2),(15/16)),
	},
	walls=l1oneaw
 }
 
  require("level1.onebw")

 oneb={
	bg=love.graphics.newImage("level1/oneb.png"),
	gos={
		createfire((1/8),(1/3)),
		createfire((1/8),(2/3)),
		createbox((1/4),(1/4)),
		createbox((1/4),(1/2)),
		createbox((1/4),(3/4)),
		createfire((4/5),(1/2)),
		-- createfire((9/10),(1/3)),
		-- createfire((9/10),(2/3)),
		createexit((15/16),(1/2)),
		createexit((1/2),(0)),
	},
	walls=l1onebw
 }
 
   require("level1.onecw")

 onec={
	bg=love.graphics.newImage("level1/onec.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/3),(3/6)),
		-- createbox((1/2),(4/6)),
		createbox((1/3),(5/6)),
		createbox((2/3),(3/6)),
		createbox((1/2),(3/6)),
		createfire((1/2),(1/4)),
		createfire((2/3),(1/4)),
		createfire((3/4),(7/8)),
		createexit((1/2),(15/16)),
		createexit((0),(1/2)),
	},
	walls=l1onecw
 }
 
   require("level1.onedw")

 oned={
	bg=love.graphics.newImage("level1/oned.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		createfire((3/4),(1/2)),
		createfire((1/4),(1/2)),
		createbox((1/2),(1/2)),
		createbox((1/3),(1/2)),
		createbox((2/3),(1/2)),
		createbox((3/4),(1/3)),
		createbox((3/4),(1/6)),
		createexit((1/2),0),
		createexit((1/2),1),
		
	},
	walls=l1onedw
 }
 
   require("level1.oneew")
 
 onee={
	bg=love.graphics.newImage("level1/onee.png"),
	gos={
		-- createbox((3/7),(1/3)+(1/10)),
		-- createbox((5/7),(1/3)+(1/10)),
		-- createbox((4/7),(1/3)+(1/10)),

		-- createbox((2/7),(1/2)+(1/10)),
		-- createfire((3/7),(1/2)+(1/10)),
		-- createbox((6/7),(1/2)+(1/10)),
		-- createfire((5/7),(1/2)+(1/10)),
		-- createbox((4/7),(1/2)+(1/10)),

		-- createbox((3/7),(2/3)+(1/10)),
		-- createbox((5/7),(2/3)+(1/10)),
		-- createbox((4/7),(2/3)+(1/10)),

		-- createbox((3/7),(4/5)+(1/10)),
		-- createbox((5/7),(4/5)+(1/10)),

		-- createfire((2/7),(4/5)+(1/10)),
		-- createfire((4/7),(4/5)+(1/10)),
		-- createfire((6/7),(4/5)+(1/10)),

		
		createexit((1/2),0),
	},
	walls=l1oneew
 }
 createnfs(onee.gos,l1oneewbfs)

 onef={
	bg=love.graphics.newImage("level1/onef.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	}
 }
 -- oneb={}
 -- onec={}

 mzx=2
 mzy=4
 
 lvl={}
 maxslot=2*4
 for i=0,8
 do
	lvl[i]=nil
 end
 
 lvl[0]=onea
 lvl[2]=oneb
 lvl[3]=onec
 lvl[5]=oned
 -- lvl[6]=onef
 lvl[7]=onee

 
 
 
 cx=0
 cy=0
 curscreen=onea

 -- cx=1
 -- cy=3
 -- curscreen=onee
 
 love.audio.play(ambiance)
end



function boss1gplay()
	--gplay variables
	firezoominc=0.1
	minfirezoom=0.2
	maxfirezoom=3
	--amount zoom of fire is decreased on fire hit
	waterzoominc=-0.3
	--rank decrease when water splashes fire
	waterreward=0.4

	--zoom step to create new small fires
	firestep=0.5
	childinhibcycles=180

	fireinctimer=0
	fireincchg=120

	--number of cycles before automatic fire update
	tickupref=45
	livingfirebonus=0.01

	devilhit=0.01
end

-- boss1=
function initboss1()
  name='boss 1'
  -- dfltgplay()  
  boss1gplay()
  globinit()
  
  ply.x=pfw/2
  ply.y=pfh/8
 bossone={
	bg=love.graphics.newImage("level1/onef.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		-- createbox((1/4),(2/7)),
		-- createbox((3/4),(2/7)),
		-- createbox((1/4),(3/7)),
		-- createbox((3/4),(3/7)),
		createfire((1/5),(5/7)),
		createfire((4/5),(5/7)),
		createdevil(0.5,0.3,-1,-1),
		createdbarrel(0.5,0.7),

		-- createbox((1/2),(1/4)),
		-- createexit((1/2),(15/16)),
	}
 }
 

 mzx=1
 mzy=1
 
 lvl={}
 -- maxslot=2*4
 -- for i=0,8
 -- do
	-- lvl[i]=nil
 -- end
 
 lvl[0]=bossone

 cx=0
 cy=0
 curscreen=bossone
 
 love.audio.play(ambiance)
end

--lvl 2 gplay
function lv2gplay()
	--gplay variables
	firezoominc=0.1
	minfirezoom=0.2
	maxfirezoom=3
	--amount zoom of fire is decreased on fire hit
	waterzoominc=-0.3
	--rank decrease when water splashes fire
	waterreward=1

	--zoom step to create new small fires
	firestep=0.5
	childinhibcycles=180

	fireinctimer=0
	fireincchg=120

	--number of cycles before automatic fire update
	tickupref=45
	livingfirebonus=0.002

end

-- lvl2=
function initlvl2()
  name='floor 2'
  lv2gplay()
  globinit() 
  ply.x=pfw/2
  ply.y=pfh/5
 require("level2.oneaw")

  onea={
	bg=love.graphics.newImage("level2/1a.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		-- createbox((1/4),(2/7)),
		-- createbox((3/4),(2/7)),
		-- createbox((1/4),(3/7)),
		-- createbox((3/4),(3/7)),
		-- createfire((1/5),(5/7)),
		-- createfire((4/5),(5/7)),
		-- createbox((1/2),(1/4)),
		createexit((15/16),(1/2)),
		createexit((1/2),(15/16)),
	},
	walls=oneaw,
 }
 createbfs(onea.gos,oneawbfs)
 

 require("level2.onebw")
 print(onebw)
 oneb={
	bg=love.graphics.newImage("level2/1b.png"),
	gos={
		createfire((3/4),(1/2),1,bluefireframes,true),
		-- createfire((1/8),(1/3)),
		-- createfire((1/8),(2/3)),
		-- createbox((1/4),(1/4)),
		-- createbox((1/4),(1/2)),
		-- createbox((1/4),(3/4)),
		-- createfire((4/5),(1/2)),
		-- createfire((9/10),(1/3)),
		-- createfire((9/10),(2/3)),
		createexit((15/16),(1/2)),
		createexit((1/16),(1/2)),
	},
	walls=onebw,
 }
  createbfs(oneb.gos,onebwbfs)

  require("level2.onecw")

 onec={
	bg=love.graphics.newImage("level2/1c.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/3),(3/6)),
		-- createbox((1/2),(4/6)),
		-- createbox((1/3),(5/6)),
		-- createbox((2/3),(3/6)),
		-- createbox((1/2),(3/6)),
		-- createfire((1/2),(1/4)),
		-- createfire((2/3),(1/4)),
		-- createfire((3/4),(7/8)),
		createexit((1/2),(15/16)),
		createexit((0),(1/2)),
	},
	walls=onecw,
 }
  createbfs(onec.gos,onecwbfs)
 
 require("level2.twoaw")
 twoa={
	bg=love.graphics.newImage("level2/2a.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createfire((3/4),(1/2)),
		-- createfire((1/4),(1/2)),
		-- createbox((1/2),(1/2)),
		-- createbox((1/3),(1/2)),
		-- createbox((2/3),(1/2)),
		-- createbox((3/4),(1/3)),
		-- createbox((3/4),(1/6)),
		-- createexit((1/2),(1/10)),
		-- createexit((1/2),(9/10)),
		createexit((1/2),0),
		createexit((1/2),15/16),
		
	},
	walls=twoaw
 }
  createbfs(twoa.gos,twoawbfs)
 
 require("level2.twocw")
 twoc={
	bg=love.graphics.newImage("level2/2c.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((3/7),(1/3)),
		-- createbox((5/7),(1/3)),
		-- createbox((4/7),(1/3)),

		-- createbox((2/7),(1/2)),
		-- createfire((3/7),(1/2)),
		-- createbox((6/7),(1/2)),
		-- createfire((5/7),(1/2)),
		-- createbox((4/7),(1/2)),

		-- createbox((3/7),(2/3)),
		-- createbox((5/7),(2/3)),
		-- createbox((4/7),(2/3)),

		-- createbox((3/7),(4/5)),
		-- createbox((5/7),(4/5)),

		-- createfire((2/7),(4/5)),
		-- createfire((4/7),(4/5)),
		-- createfire((6/7),(4/5)),

		
		createexit((1/2),0),
		createexit((1/2),15/16),
	},
	walls=twocw
 }
  createbfs(twoc.gos,twocwbfs)


 require("level2.threeaw")
 threea={
	bg=love.graphics.newImage("level2/3a.png"),
	gos={
		createexit((1/2),0),
		createexit(15/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	},
	walls=threeaw,
 }
 createbfs(threea.gos,threeawbfs)
 
 require("level2.threebw")
 threeb={
	bg=love.graphics.newImage("level2/3b.png"),
	gos={
		createexit(0,(1/2)),
		createexit(15/16,(1/2)),
		-- createexit(15/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	},
	walls=threebw,
 }
 createbfs(threeb.gos,threebwbfs)
 
 
 require("level2.threecw")
 threec={
	bg=love.graphics.newImage("level2/3c.png"),
	gos={
		createexit((1/2),0),
		createexit(1/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	},
	walls=threecw,
 }
 createbfs(threec.gos,threecwbfs)
 -- oneb={}
 -- onec={}

 mzx=5
 mzy=4
 
 lvl={}
 maxslot=5*4
 for i=0,maxslot
 do
	lvl[i]=nil
 end
 
 --onea    oneb   onec
 --twoa           twoc
 --threea threeb threec threed threee
 --       fourb  fourc  fourd
 
 lvl[0]=onea
 lvl[1]=oneb
 lvl[2]=onec
 lvl[5]=twoa
 -- lvl[6]=onef
 lvl[7]=twoc
 lvl[10]=threea
 lvl[11]=threeb
 lvl[12]=threec
 cx=1
 cy=0
 curscreen=oneb
 
 love.audio.play(ambiance)
end

function boss2gplay()
	--gplay variables
	firezoominc=0.1
	minfirezoom=0.2
	maxfirezoom=3
	--amount zoom of fire is decreased on fire hit
	waterzoominc=-0.3
	--rank decrease when water splashes fire
	waterreward=0.4

	--zoom step to create new small fires
	firestep=0.5
	childinhibcycles=180

	fireinctimer=0
	fireincchg=120

	--number of cycles before automatic fire update
	tickupref=45
	livingfirebonus=0.01

	devilhit=1
end

-- boss2=
function initboss2()
  name='boss 2'
  -- dfltgplay() 
  boss2gplay()  
  globinit()
  
  ply.x=pfw/2
  ply.y=pfh/8
 bosstwo={
	bg=love.graphics.newImage("level1/onef.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		-- createbox((1/4),(2/7)),
		-- createbox((3/4),(2/7)),
		-- createbox((1/4),(3/7)),
		-- createbox((3/4),(3/7)),
		-- createfire((1/5),(5/7)),
		-- createfire((4/5),(5/7)),
		-- createdevil(0.5,0.3,-1,-1),
		
--		createdbarrel(0.5,0.7),

		-- createbox((1/2),(1/4)),
		-- createexit((1/2),(15/16)),
		createbigdevil(0.1,0.5,-1,"right"),
		createbigdevil(0.9,0.5,1,"left"),
		
	}
 }
 

 mzx=1
 mzy=1
 
 lvl={}
 -- maxslot=2*4
 -- for i=0,8
 -- do
	-- lvl[i]=nil
 -- end
 
 lvl[0]=bosstwo

 cx=0
 cy=0
 curscreen=bosstwo
 
 love.audio.play(ambiance)
end


-- lvl3=
function initlvl3()
  name='floor 3'
  lv2gplay()
  globinit() 
  ply.x=pfw/2
  ply.y=pfh*4/5
 require("level3.onecw")

  onec={
	bg=love.graphics.newImage("level3/1c.png"),
	gos={
	},
	walls=onecw,
 }
 createsnks(onec.gos,onecwm1s)
 createhsnks(onec.gos,onecwm2s)
 

 require("level3.onedw")
 oned={
	bg=love.graphics.newImage("level3/1d.png"),
	gos={
	},
	walls=onedw,
 }
  createsnks(oned.gos,onedwm1s)
  createhsnks(oned.gos,onedwm2s)

  require("level3.twocw")

 twoc={
	bg=love.graphics.newImage("level3/2c.png"),
	gos={
	},
	walls=twocw,
 }
  createsnks(twoc.gos,twocwm1s)
  createhsnks(twoc.gos,twocwm2s)
 
 require("level3.threecw")
 threec={
	bg=love.graphics.newImage("level3/3c.png"),
	gos={
	},
	walls=threecw
 }
  createsnks(threec.gos,threecwm1s)
  createhsnks(threec.gos,threecwm2s)
 
 require("level3.twocw")
 twoc={
	bg=love.graphics.newImage("level3/2c.png"),
	gos={
	},
	walls=twocw
 }
  createsnks(twoc.gos,twocwm1s)
  createhsnks(twoc.gos,twocwm2s)


 require("level3.threeaw")
 threea={
	bg=love.graphics.newImage("level3/3a.png"),
	gos={
	},
	walls=threeaw,
 }
 createsnks(threea.gos,threeawm1s)
 createhsnks(threea.gos,threeawm2s)
 
 require("level3.threebw")
 threeb={
	bg=love.graphics.newImage("level3/3b.png"),
	gos={
	},
	walls=threebw,
 }
 createsnks(threeb.gos,threebwm1s)
 createhsnks(threeb.gos,threebwm2s)
 
 
 require("level3.threecw")
 threec={
	bg=love.graphics.newImage("level3/3c.png"),
	gos={
	},
	walls=threecw,
 }
 createsnks(threec.gos,threecwm1s)
 createhsnks(threec.gos,threecwm2s)

 
 require("level3.fouraw")
 foura={
	bg=love.graphics.newImage("level3/4a.png"),
	gos={
	},
	walls=fouraw,
 }
 createsnks(foura.gos,fourawm1s)
 createhsnks(foura.gos,fourawm2s)

 
 require("level3.fiveaw")
 fivea={
	bg=love.graphics.newImage("level3/5a.png"),
	gos={
		-- createnegaben(0.4,0.5,1,1)
	},
	walls=fiveaw,
 }
 createsnks(fivea.gos,fiveawm1s)
 createhsnks(fivea.gos,fiveawm2s)
 
 
 mzx=4
 mzy=5
 
 lvl={}
 maxslot=mzx*mzy
 for i=0,maxslot
 do
	lvl[i]=nil
 end
 
 --               onec  oned
 --               twoc
 --threea threeb threec 
 --foora
-- fivea 
 
 lvl[2]=onec
 lvl[3]=oned
 lvl[6]=twoc
 lvl[8]=threea
 lvl[9]=threeb
 lvl[10]=threec
 lvl[12]=foura
 lvl[16]=fivea
 cx=0
 cy=4
 curscreen=fivea
 
 love.audio.play(ambiance)
end



levels={initlvl1,initboss1,initlvl2,initboss2,initlvl3}



--true if blocking hasard
function checkroom(r)
   for j,o in pairs (lvl[r].gos)
   do
    if o.blockvictory~=nil then
	
	 return true
	end
   end
   return false
end

function checkvictory()
--checking if no fire left in any room 
 for i=0,(mzx*mzy-1)
 do
  if lvl[i]~=nil then
   if checkroom(i) then return false end --not victory , at least one hazard
  end
 end
 print("victory")
 return true
 
end


function getscreenfromoffset(mox,moy)
	tcx=cx+mox
	tcy=cy+moy
	ret=tcx+tcy*mzx
	print("tgt screen number "..ret)
	return lvl[ret]
end

function navigate(mox,moy,nx,ny)

	cx=cx+mox
	cy=cy+moy
	offset=cx+cy*mzx
	print("new screen number "..offset)
	
	if lvl[offset]~=nil then
	 curscreen=lvl[offset]
	
	 bullets={}
	 ply.x=nx
	 ply.y=ny
	 return true
	else
	 return false
	end
end