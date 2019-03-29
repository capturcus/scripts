#!/usr/bin/python

import sys, os

NAME = sys.argv[1]

def is_meme(name):
    # facebook
    try:
        fbname = name[:-5]
    except:
        pass
    if fbname.replace("_", "").isdigit():
        return True
    return name.startswith("Screenshot_")

def extension(name):
    return name.split(".")[-1]

for f in os.listdir(os.getcwd()):
    if is_meme(f):
        os.rename(f, "memes/"+NAME+"."+extension(f))
        break
    