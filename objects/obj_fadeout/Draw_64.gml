switch fadeto {
	case fadetypes.black:
		gpu_set_blendmode(bm_subtract)
		break;
	case fadetypes.white:
		gpu_set_blendmode(bm_add)
		break;
	case fadetypes.whitetoblack:
		if fadetype == "out" gpu_set_blendmode(bm_add) else gpu_set_blendmode(bm_subtract)
		break;
}

var r = make_color_rgb(values[red], 0, 0)
var g = make_color_rgb(0, values[green], 0)
var b = make_color_rgb(0, 0, values[blue])

var fr = make_color_rgb(values[fakered], 0, 0)
var fg = make_color_rgb(0, values[fakegreen], 0)
var fb = make_color_rgb(0, 0, values[fakeblue])

draw_colored_rect(0, 0, room_width, room_height, fr)
draw_colored_rect(0, 0, room_width, room_height, fg)
draw_colored_rect(0, 0, room_width, room_height, fb)

draw_colored_rect(0, 0, room_width, room_height, r)
draw_colored_rect(0, 0, room_width, room_height, g)
draw_colored_rect(0, 0, room_width, room_height, b)

gpu_set_blendmode(bm_normal)

/* For debugging purposes */
draw_colored_rect(0, 0, 8, 8, r)
draw_colored_rect(8, 0, 16, 8, g)
draw_colored_rect(16, 0, 24, 8, b)
draw_colored_rect(0, 8, 8, 8, fr)
draw_colored_rect(8, 8, 16, 8, fg)
draw_colored_rect(16, 8, 24, 8, fb)

switch fadeto {
	default:
		if fadetype == "out" {
			if blue < 8 {
				if green < 8 {
					if red < 8
						red++
					else green++
				} else blue++
			} else {
				fadetype = "in"
				room_goto(targetroom)
			}
		} else {
			if red > 0 {
				if green > 0 {
					if blue > 0
						blue--
					else green--
				} else red--
			} else instance_destroy()
		}
		break;
	case fadetypes.whitetoblack:
		if fadetype == "out" {
			if blue < 8 {
				if green < 8 {
					if red < 8 {
						if fakeblue < 8 {
							if fakegreen < 8 {
								if fakered < 8
									fakered++
								else fakegreen++
							} else fakeblue++
						} else red++
					} else green++
				} else blue++
			} else {
				fadetype = "in"
				room_goto(targetroom)
				fakeblue = 0
				fakegreen = 0
				fakered = 0
			}
		} else {
			if red > 0 {
				if green > 0 {
					if blue > 0
						blue--
					else green--
				} else red--
			} else instance_destroy()
		}
		break;
		break;
}