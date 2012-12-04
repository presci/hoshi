#!/usr/bin/python


import sys
import webcolors
import re

def get_pixel_color(i_x, i_y):
    import PIL.Image # python-imaging
    import PIL.ImageStat # python-imaging
    import Xlib.display # python-xlib
    o_x_root = Xlib.display.Display().screen().root
    o_x_image = o_x_root.get_image(i_x, i_y, 1, 1, Xlib.X.ZPixmap, 0xffffffff)
    o_pil_image_rgb = PIL.Image.fromstring("RGB", (1, 1), o_x_image.data, "raw", "BGRX")
    lf_colour = PIL.ImageStat.Stat(o_pil_image_rgb).mean
    return tuple(map(int, lf_colour))

def closest_color(requested_colour):
    min_colours = {}
    for key, name in webcolors.css3_hex_to_names.items():
        r_c, g_c, b_c = webcolors.hex_to_rgb(key)
        rd = (r_c - requested_colour[0]) ** 2
        gd = (g_c - requested_colour[1]) ** 2
        bd = (b_c - requested_colour[2]) ** 2
        min_colours[(rd + gd + bd)] = name
    return min_colours[min(min_colours.keys())]

def get_color_name(requested_color):
    try:
        closest_name = actual_name=webcolors.rgb_to_name(requested_color)
    except ValueError:
        closest_name = closest_color(requested_color)
        actual_name=None
    return closest_name
 
# print get_pixel_colour(869, 82)
K=get_pixel_color(int(sys.argv[1]), int(sys.argv[2]))
# print "%03d%03d%03d" % K
red=(re.compile("red"), re.compile("maroon"), re.compile("brown"))
green=(re.compile("green"), re.compile("een"))
blue=(re.compile("blue"), re.compile("aqua"), re.compile("cyan"))
Color=get_color_name(K)


# red
if int( sys.argv[3]) == 0 :
    for w in red:
        tmp=w.findall(Color)
        if len(tmp) > 0:
            print 0
            sys.exit(0)
# green
if int( sys.argv[3]) == 1 :
    for w in green:
        tmp=w.findall(Color)
        if len(tmp) > 0:
            print 0
            sys.exit(0)
# blue
if int( sys.argv[3]) == 2 :
    for w in blue:
        tmp=w.findall(Color)
        if len(tmp) > 0:
            print 0
            sys.exit( 0)


print 1
