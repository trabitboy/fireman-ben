
--index to be able to remove from list
function gbehavior(me,index)
 me.x=me.x+me.vx*rank
 me.y=me.y+me.vy*rank
 
 if me.descending then
  if me.vx<=-me.initvx then
   me.descending=false
  else
   me.vx=me.vx-rank
  end
 else --ascending
  if me.vx>=me.initvx then
   me.descending=true
  else
   me.vx=me.vx+rank
  end
 end
 
 if g.inhib>=0 then
  g.inhib=g.inhib-rank
 else
  if g.attackfunc~=nil then
   g.attackfunc(me.x,me.y,px,py,2*rank,bb)
   g.inhib=32
  end
 end
 
 if me.y > pfh  then
  table.remove(gameobjs,index)
 end

 if  me.hp<=0 then
  love.audio.play(fire)
  table.remove(gameobjs,index)
  createprop(me.x,me.y,xpl)
  --TODO multiplier to remove?
  score=score+100 * multiplier*rank
  createdrop(me.x,me.y,pill)  
  
 end

 -- print(me.x)
 -- if me.x>pfw-me.picdata:getWidth() or me.x<50 then
  -- me.vx=-me.vx
  -- me.vy=-me.vy  
 -- end
 
 --simple test for obj deletion 
 -- if x>400 then
  -- print("aaaaaaaaaaargh")
  -- table.remove(gameobjs,index)
 -- end
end


--attackfunc can be nil
function createghost(xg,yg,vx,vy,pic,spawnpos,attackfunc)
 g={}
 g.hp=1
 g.spawnpos=spawnpos
 g.initvx=vx
 
 g.attackfunc=baddybullet
 
 if vx>0 then
  g.descend=true
 else 
  g.descent=false
 end
 
 g.inhib=40
 
 g.vx=vx
 g.vy=vy
 g.behavior=gbehavior
 g.pic=pic
 g.picdata=pic:getData()

 g.x=xg-g.picdata:getWidth()/2
 g.y=yg-g.picdata:getHeight()/2

 
 g.hbx=computebox(8,g.picdata)
 
 -- print("width")
 -- print(g.picdata:getWidth())
 table.insert(evtbuffer,g)
end
