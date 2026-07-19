{ ... }: {
  flake.homeModules.zsh = { ... }: {
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
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        pkgs.zsh-autosuggestions
      ];
      theme = "robbyrussell";
    };
  };
}
