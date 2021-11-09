#!/usr/bin/python
# -*- coding: UTF-8 -*-

import subprocess, re

speed = "0.500000,"
mouse_prefix = "⎜   ↳"

def get_mouse_ids():
    out = subprocess.check_output(["xinput", "list"])
    ids = []
    for line in out.split("\n"):
        if mouse_prefix in line:
            pattern = 'id=([0-9]+)'
            a = re.search(pattern, line)
            ids.append(a.group()[3:])
    return ids

mouse_ids = get_mouse_ids()
prop = "Coordinate Transformation Matrix"

for mouse_id in mouse_ids:
    out = subprocess.check_output(["xinput", "list-props", mouse_id])
    for line in out.split("\n"):
        if prop in line:
            prop_id = line[35:].split(")")[0]
            break
    subprocess.check_output(["xinput", "set-prop", mouse_id, prop_id, speed, "0.000000,", "0.000000,", "0.000000,", speed, "0.000000,", "0.000000,", "0.000000,", "1.00000"])
