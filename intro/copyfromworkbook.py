#copy level frames from zzn workbook
#renames
#TODO calculate forbidden areas and save as lua source
import pygame
import os
import shutil
from pygame.locals import *

wb="c:/Users/thomas/Dropbox/current_zazanim_projects/firemanben/"
tgt="./"

tomove=[
    {'i':"069",'t':"bg"},
    {'i':"070",'t':"t1"},
    {'i':"071",'t':"t2"},
    {'i':"072",'t':"t3"},
    {'i':"073",'t':"t4"},
    {'i':"074",'t':"t5"},
    {'i':"075",'t':"t6"},
    {'i':"076",'t':"t7"},

    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    pygame.image.save(src,tgt+obj['t']+'ts.png')
