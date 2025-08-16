{ config, pkgs, ... }:
{
	nixpkgs.overlays = [
		(self: super: {
			slstatus = super.slstatus.overrideAttrs (old: {
				src = /home/haiminh256/slstatus;
				postPatch = ''
					make clean
				'';
				buildInputs = (old.builtInputs or []) ++ (with super; [
					libdrm
					libxkbcommon
					xorg.libxcb
					libinput
					pixman
					xorg.libX11
					xorg.xcbutil
					xorg.libXau
					xorg.libXdmcp
					xorg.xcbutilwm
				]);
			});
		})
	];
}
