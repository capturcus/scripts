#!/usr/bin/python

import subprocess, re

mouses = ["A4Tech USB Mouse", "COMPANY USB Device"]

def get_mouse_id():
    out = subprocess.check_output(["xinput", "list"])
    for line in out.split("\n"):
        for mouse in mouses:
            if mouse in line:
                pattern = 'id=([0-9]+)'
                a = re.search(pattern, line)
                return a.group()[3:]

mouse_id = get_mouse_id()
prop = "Coordinate Transformation Matrix"

out = subprocess.check_output(["xinput", "list-props", mouse_id])
for line in out.split("\n"):
    if prop in line:
        prop_id = line[35:].split(")")[0]
        break

subprocess.check_output(["xinput", "set-prop", mouse_id, prop_id, "0.500000,", "0.000000,", "0.000000,", "0.000000,", "0.500000,", "0.000000,", "0.000000,", "0.000000,", "1.00000"])
