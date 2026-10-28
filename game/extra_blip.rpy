init python:
    def blip_voice(event, interact=True, blipfile="", **kwargs):
        if not interact:
            return
        if not blipfile:
            return
        if event == "show_done":
            renpy.sound.play(blipfile, loop=True)
        elif event == "slow_done" or event == "end":
            renpy.sound.stop(fadeout=0.1)