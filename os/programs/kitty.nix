{ pkgs, inputs, ... }: {
 flake.homeModules.kitty = { pkgs, ... }: {
 	programs.kitty = {
		enable = true;
		settings = {
			confirm_os_window_close = 0;
			dynamic_background_opacity = true;
			enable_audio_bell = false;
			mouse_hide-wait = "-1.0";
			window_padding_width = 10;
			background_opacity = "0.9";
			background_blur = 5;

			cursor_trail = 30;
			cursor_trail_start_threshold = 0;
			cursor_trail_decay = "0.01 0.05";
			cursor_shape = "beam";
			cursor_blink = true;

			font_size = 16;
		};
	};
};
}
