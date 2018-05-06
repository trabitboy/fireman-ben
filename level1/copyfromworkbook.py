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
    {'i':"083",'t':"onea"},
    {'i':"084",'t':"oneaw"},
    {'i':"085",'t':"oneb"},
    {'i':"086",'t':"onebw"},
    {'i':"087",'t':"onec"},
    {'i':"088",'t':"onecw"},
    {'i':"089",'t':"oned"},
    {'i':"090",'t':"onedw"},
    {'i':"091",'t':"onee"},
    {'i':"092",'t':"oneew"},
    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    pygame.image.save(src,tgt+obj['t']+'.png')
