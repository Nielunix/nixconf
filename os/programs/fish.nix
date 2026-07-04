{ ... }: {
  flake.homeModules.fish = { ... }: {
    programs.fish = {
      enable = true;
          interactiveShellInit = ''
          function fish_greeting
	  	echo 	Welcome Lunix .........\\_.O._/........ Rrwaarrr
	end
          zoxide init fish | source

          fish_add_path /home/lugryn/.cargo/bin
	  set -gx NIXPKGS_ALLOW_UNFREE 1
        '';

      shellAliases = {
        ls = "eza -l";
        cd = "z";
        nhu = "nh os switch ~/nixconf#lunix";
        vi = "nvim";
      };
    };
  };
}
