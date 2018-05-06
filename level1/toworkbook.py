#copy level frames from zzn workbook
#renames
#TODO calculate forbidden areas and save as lua source
import pygame
import os
import shutil
from pygame.locals import *

srcfld="./"
wb="c:/Users/thomas/Dropbox/current_zazanim_projects/firemanben/"

tomove=[
    {'i':"onea",'t':"083"},
    {'i':"oneb",'t':"084"},
    {'i':"onec",'t':"085"},
    {'i':"oned",'t':"086"},
    {'i':"onee",'t':"087"},

    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(srcfld+obj['i']+'.png')
    tmp=pygame.Surface((640,480))
    empty=Color(0,0,0,0)
    tmp.fill(empty)
    tmp.blit(src,(0,0))
    pygame.image.save(tmp,wb+"frame"+obj['t']+'.bmp')
