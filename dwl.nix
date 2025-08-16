{ config, pkgs, ... }:
{
	nixpkgs.overlays = [
		(self: super: {
			dwl = super.dwl.overrideAttrs (old: {
				src = /home/haiminh256/dwl-config;
				postPatch = ''
					make clean
				'';
				buildInputs = (old.builtInputs or []) ++ (with super; [
					libdrm
					wlroots_0_18
					wayland
					wayland-protocols
					mesa
					xwayland
					fcft
					tllist
					libxkbcommon
					xorg.libxcb
					libinput
					pixman
					xorg.libX11
					xorg.xcbutil
					xorg.xcbutilwm
				]);
			});
		})
	];
}
