if instance_exists(obj_fadeout) return
with instance_create_depth(0, 0, 0, obj_fadeout) {
	fadeto = fadetypes.white
	switch room {
		case marble: targetroom = greenhill break;
		case greenhill: targetroom = marble break;
	}
}