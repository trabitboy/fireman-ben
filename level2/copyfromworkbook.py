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
    {'i':"047",'t':"1b"},
    {'i':"048",'t':"1bw"},
    {'i':"049",'t':"1a"},
    {'i':"050",'t':"1aw"},
    {'i':"051",'t':"1c"},
    {'i':"052",'t':"1cw"},
    {'i':"053",'t':"2a"},
    {'i':"053",'t':"2c"},
    {'i':"054",'t':"2aw"},
    {'i':"054",'t':"2cw"},
    {'i':"055",'t':"3a"},
    {'i':"056",'t':"3aw"},
    {'i':"057",'t':"3c"},
    {'i':"058",'t':"3cw"},
    {'i':"059",'t':"3b"},
    {'i':"060",'t':"3bw"},

    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    pygame.image.save(src,tgt+obj['t']+'.png')
