
function computebox(m,picdata,zoom)
 r={}
 r.x=m*zoom
 r.w=picdata:getWidth()*zoom - 2*m*zoom
 r.y=m*zoom
 r.h=picdata:getHeight()*zoom - 2*m*zoom
 
 return r
end



--doesnt take zoom into account
function collhbs(x1,y1,hb1,x2,y2,hb2)
 return coll(x1+hb1.x,y1+hb1.y,hb1.w,hb1.h,x2+hb2.x,y2+hb2.y,hb2.w,hb2.h)
end

function outofpf(x,y,w,h)
 if x< -w or y <-h then
  return true
 end
  
 if x> pfw or y >pfh then
  return true
 end
  
 return false
end 


function ocoll(o1,o2)
	return coll(o1.x,o1.y,o1.w,o1.h,o2.x,o2.y,o2.w,o2.h)
end

function coll(x1,y1,w1,h1,x2,y2,w2,h2)
 if 
  (
   ((x2<=x1+w1)and(x2>=x1))
   or
   ((x1<=x2+w2)and(x1>=x2))
  )
  and
  (
   ((y2<=y1+h1)and(y2>=y1))
    or
    ((y1<=y2+h2)and(y1>=y2))
  )  
 then    
    
  return true
 end
 
 return false
end
