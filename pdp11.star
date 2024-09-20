"""
Applet: PDP11
Summary: PDP11 with Blinking Lights
Description: Watch the lights blink
Author: Matt Fischer
"""

load("render.star", "render")
load("encoding/base64.star", "base64")

DEC_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAABEAAAAJCAYAAADU6McMAAAAUElEQVQoU2NkwAP+AwEjEOBTA5LDqwCXITBxGM0IYsBsgtmKL
IbsCpA8uhxIDCyIrhkfH1kPiksGjyGkhAlILdaAxReNxEQzSsBiSw/EGAIAgkGEClJJxQ8AAAAASUVORK5CYII=
""")

RED = "#a12627"
PURPLE = "#4f1932"
COLOR_BOX_HEIGHT = 2

LED_ON = "#ff1111"
BOX_ON = "#202020"
LED_OFF = "#220000"
BOX_OFF = "#090909"

def topRow():
    return render.Row(
        main_align="start",
        cross_align="start",
        children = [
            render.Image(src=DEC_ICON),
        ],
    )

def makeLed(ledOn):
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

def ledRow(leftPad, separationDistance = 3):

    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = [
            render.Box(width = leftPad, height = 1),
            makeLed(True),
            makeLed(False),
            makeLed(True),
            makeLed(False),
            makeLed(True),
            makeLed(True),
            makeLed(False),
            makeLed(False),
            makeLed(True),
            makeLed(False),
            makeLed(False),
            makeLed(True),
            makeLed(False),
            makeLed(True),
            makeLed(True),
            makeLed(False),
            makeLed(True),
            makeLed(True),
            makeLed(False),
        ]
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

    return render.Row(
        main_align = "start",
        cross_align = "start",
        expanded = True,
        children = [
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
            emptyBox(boxSize),
            makeBox(boxSize, RED),
            emptyBox(boxSize),
            makeBox(boxSize, PURPLE),
        ]
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
                emptyRow(2),
                bottomRow(),
            ],
        ),
    )

def main():
    return render_pdp()