"""
Applet: PDP11
Summary: PDP11 with Blinking Lights
Description: Watch the lights blink
Author: Matt Fischer
"""

load("encoding/base64.star", "base64")
load("render.star", "render")
load("random.star", "random")

PDP11_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAB4AAAAJCAYAAAAl45yBAAAAeElEQVQ4T9VTQQ7AIAgb/3/0JktqaiNVDzuMy
yLUljKMy8TdIlo4jNZ271jSigR5rXPeNZtmIsEAwR3nmEDxWeOJzBoFF3N3YRV0Z4jzNxuoRCvc6/i3ws6tTg
PY43/MRNWSVWKcH0Y928TV81i5hZgu6SfCO+/+AT5O7ApMY07rAAAAAElFTkSuQmCC
""")

RED = "#a12627"
PURPLE = "#4f1932"
COLOR_BOX_HEIGHT = 2

def topRow():
    return render.Row(
        main_align="start",
        cross_align="start",
        children = [
            render.Image(src=PDP11_ICON),
        ],
    )

def makeLed(ledOn):
    LED_ON = "#ff1111"
    BOX_ON = "#202020"
    LED_OFF = "#220000"
    BOX_OFF = "#090909"

    if ledOn == True:
        ledColor = LED_ON
        boxColor = BOX_ON
    else:
        ledColor = LED_OFF
        boxColor = BOX_OFF

    return render.Box(width = 3, 
        height = 4, 
        color = boxColor,
        child = render.Box(width = 1,
            height = 1,
            color = ledColor)
    )


def randomLedRow(leftPad,count=22):
    leds = []
    leds.append(render.Box(width = leftPad, height = 1))
    for i in range(1,23):
        state = bool(random.number(0,1))
        leds.append(makeLed(state))
    
    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = leds
    )

def ledRow(leftPad, frameDelay = 10):
    state1 = [randomLedRow(leftPad)] * frameDelay
    state2 = [randomLedRow(leftPad)] * frameDelay
    state3 = [randomLedRow(leftPad)] * frameDelay
    state4 = [randomLedRow(leftPad)] * frameDelay
    state5 = [randomLedRow(leftPad)] * frameDelay
    state6 = [randomLedRow(leftPad)] * frameDelay

    return render.Animation(
        children = state1 + state2 + state3 + state4
    )

def secondRow():
    small = 3
    wide = 7

    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = [
            render.Box(width = small, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
        ]
    )

def thirdRow(leftPad):
    small = 3
    wide = 7

    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = [
            render.Box(width = leftPad, height = COLOR_BOX_HEIGHT),
            render.Box(width = small, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = PURPLE),
            render.Box(width = wide, height = COLOR_BOX_HEIGHT, color = RED),
        ]
    )


def emptyRow(rowHeight = 1):
    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = [
            render.Box(width=50, height = rowHeight),
        ]
    )

def makeBox(boxSize, boxColor):
    return render.Box(
        width = boxSize,
        height = boxSize,
        color = boxColor,
    )

def emptyBox(boxSize):
    return render.Box(
        width = 1,
        height = boxSize
    )

def bottomRow():
    boxSize = 3

    boxes = []
    for i in range(8):
        boxes.append(makeBox(boxSize, RED))
        boxes.append(emptyBox(boxSize))
        boxes.append(makeBox(boxSize, PURPLE))
        boxes.append(emptyBox(boxSize))

    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = boxes
    )


def render_pdp():
    return render.Root(
        child = render.Column(
            children = [
                topRow(),
                emptyRow(),
                secondRow(),
                ledRow(1),
                emptyRow(3),
                thirdRow(20),
                ledRow(24),
                emptyRow(4),
                bottomRow(),
            ],
        ),
    )

def main():
    return render_pdp()