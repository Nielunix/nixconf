{ ... }: {
  flake.homeModules.zsh = { pkgs, ... }: {
    home.packages = with pkgs; [
      starship
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ls = "eza -l";
        la = "eza -la";
        vi = "nvim";
        nhu = "nh os switch ~/nixconf#lunix";
        cd = "z";
        dev = "nix develop";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";

      initContent = ''
        echo 	"Welcome Lunix .........\\_.O._/........ Rrwaarrr"

        eval "$(starship init zsh)"

      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "zoxide"
        ];
      };
    };
  };
}
