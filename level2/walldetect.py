import pygame
import os
from pygame.locals import *
from array import *
from queue import *

#script to generate wall masks
#TODO save debug image at each step ( state of treated map )


##pics=["walltest.bmp"]
pics=[
    {'p':"1aw.png",'o':'oneaw'},
    {'p':"1bw.png",'o':'onebw'},
    {'p':"1cw.png",'o':'onecw'},
    {'p':"2aw.png",'o':'twoaw'},
    {'p':"2cw.png",'o':'twocw'},
    {'p':"3aw.png",'o':'threeaw'},
    {'p':"3bw.png",'o':'threebw'},
    {'p':"3cw.png",'o':'threecw'},
    
    ]
##cvsw=640
##cvsh=480

##treated=array('i')
treated=None

##wallboxes=[]
wallcolor={
    'r':243,
    'g':0,
    'b':0
    }
wallkey=1

bfcol={
    'r':0,
    'g':243,
    'b':243
    }
bfkey=2

def createlua(ws,bfs,fname):
    f=open(fname+'.lua','w')
    f.write(fname+'={\n')
    for w in ws:
        f.write(' {\n')
        f.write(' minx='+str(w['minx'])+',\n')
        f.write(' miny='+str(w['miny'])+',\n')
        f.write(' maxx='+str(w['maxx'])+',\n')
        f.write(' maxy='+str(w['maxy'])+',\n')

        f.write(' },\n')

    f.write('}\n')
    f.write(fname+'bfs={\n')
    for w in bfs:
        f.write(' {\n')
        #TODO change to direct coords maybe
        f.write(' minx='+str(w['minx'])+',\n')
        f.write(' miny='+str(w['miny'])+',\n')
        f.write(' maxx='+str(w['maxx'])+',\n')
        f.write(' maxy='+str(w['maxy'])+',\n')

        f.write(' },\n')

    
    f.write('}')
def conditionallyaddtarget(q,map,tx,ty,key):

    if tx <0:
        return
    if ty<0:
        return
    if tx>=cvsw:
        return
    if ty>=cvsh:
        return
    
    flag=treated[cvsw*ty+tx]
    if map[cvsw*ty+tx]==key and flag==0:
##        print("treated "+str(flag) )
        if flag>0 :
            raise ValueError(" very specific bad thing happened.")
        q.put({"x":tx,"y":ty})
        treated[cvsw*ty+tx]=treated[cvsw*ty+tx]+1 #treated from now


    

def treatpoint(q,ret,map,key):
    xy=q.get()
    x=xy["x"]
    y=xy["y"]

    if x<ret["minx"]:
        ret["minx"]=x
    if y<ret["miny"]:
        ret["miny"]=y
    if x>ret["maxx"]:
        ret["maxx"]=x
    if y>ret["maxy"]:
        ret["maxy"]=y



##    print(xy)
##    print("recurse treating "+str(x)+" "+str(y))
    conditionallyaddtarget(q,map,x+1,y,key)
    conditionallyaddtarget(q,map,x,y+1,key)
    conditionallyaddtarget(q,map,x-1,y,key)
    conditionallyaddtarget(q,map,x,y-1,key)

def detectwallfromhere(x,y,map,key):
##    treated[cvsw*y+x]=1 #treated from now
    ret ={}
    ret["minx"]=x
    ret["miny"]=y
    ret["maxx"]=x
    ret["maxy"]=y
    q=Queue()
    treated[cvsw*y+x]=treated[cvsw*y+x]+1 #treated from now
    q.put({"x":x,"y":y})

    while q.empty()==False:
        treatpoint(q,ret,map,key)
    
    return ret

def buildmap(pic):
##    map=
    mask=array('b')
    for j in range(0,cvsh):
        for i in range(0,cvsw):
            color= pic.get_at((i,j))
            toappend=0
            if color.r==wallcolor['r'] and color.g==wallcolor['g'] and color.b==wallcolor['b']:
                toappend=wallkey    #is wall
            if color.r==bfcol['r'] and color.g==bfcol['g'] and color.b==bfcol['b']:
                toappend=bfkey    #is wall
##            elif color.r==0 and color.g==255 and color.b==0:
##                toappend=2 #takes damage
            mask.append(toappend)


##    for j in range(0,cvsh):
##        line=""
##        line+="["
##        for i in range(0,cvsw):
##                  line+=str(mask[cvsw*j+i])
##        line+="]\n"
##        print(line)

    return mask

def treatedmap():
    global treated
##    treated.clear()
    treated=array('i')
    for j in range(0,cvsh):
        for i in range(0,cvsw):
            treated.append(0)
##    return treated



def debugdump(treated,nbwall):

    deb=pygame.Surface((cvsw,cvsh))
    for j in range(0,cvsh):
        for i in range(0,cvsw):
            if treated[cvsw*j+i]==1 :
                deb.set_at((i,j),(255,255,255,255))
    
    pygame.image.save(deb,"debug/"+currentfile+str(nbwall)+".png")


def detectzone(x,y,key,result):
                if treated[j*cvsw+i]==0 :
                    global nbwall
                    nbwall=nbwall+1
                    print("wall coll not treated yest at "+str(i)+" "+str(j))
                    wall=detectwallfromhere(x,y,map,key)
                    debugdump(treated,nbwall)
                    print(wall)
                    result.append(wall)
    


pygame.init()
i=1


currentfile=None
nbwall=None

for pic in pics:
    print( pic )
    src=pygame.image.load(pic['p'])
    currentfile=pic['p']
    cvsw=src.get_width()
    cvsh=src.get_height()

    #we need to build a map of the color for the hitboxes
    #with boolean
    map=buildmap(src)
    treatedmap()

    walls=[]
    bfs=[]
    nbwall=0

    for j in range(0,cvsh):
        for i in range(0,cvsw):
            if map[cvsw*j+i]==wallkey:
                detectzone(i,j,wallkey,walls)
##                if treated[j*cvsw+i]==0 :
##                    nbwall=nbwall+1
##                    print("wall coll not treated yest at "+str(i)+" "+str(j))
##                    wall=detectwallfromhere(i,j,map)
##                    debugdump(treated,nbwall)
##                    print(wall)
##                    walls.append(wall)
    for j in range(0,cvsh):
        for i in range(0,cvsw):
            if map[cvsw*j+i]==bfkey:
                detectzone(i,j,bfkey,bfs)
                    
                    
    createlua(walls,bfs,pic['o'])
    

    #we curse the map, when we encounter red pix,
    # if not in the already collected hitmaps,
    # we recursively curse all touching red pixs and determine
    #max x , max y , min x , min y
##    zone=detectwall
    print("treatment finished for "+pic['p'])
    
pygame.quit()
