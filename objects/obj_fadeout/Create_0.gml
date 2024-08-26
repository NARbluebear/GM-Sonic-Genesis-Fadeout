enum fadetypes {
	black,
	white,
	whitetoblack
}
red = 0
green = 0
blue = 0
values = [
	0,
	32,
	64,
	96,
	128,
	160,
	192,
	224,
	255
]

fakered = 0
fakegreen = 0
fakeblue = 0

fadeto = fadetypes.black

delay = 0
fadetime = 0
fadetype = "out"
targetroom = marble

function draw_colored_rect(x1, y1, x2, y2, color) {
	draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, false)
}
//game_set_speed(2, gamespeed_fps)