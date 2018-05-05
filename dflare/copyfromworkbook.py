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
    {'i':"078",'t':"df1"},
    {'i':"079",'t':"df2"},
    {'i':"080",'t':"df3"},
    {'i':"081",'t':"df4"},
    {'i':"082",'t':"df5"},

    ]

for obj in tomove:
    print(obj)
##    key=obj.keys().get(0)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    pygame.image.save(src,tgt+obj['t']+'ts.png')
