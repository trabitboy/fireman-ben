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
    {'i':"102",'t':"bd1"},
    {'i':"103",'t':"bd2"},
    {'i':"104",'t':"bd3"},
    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    pygame.image.save(src,tgt+obj['t']+'ts.png')
