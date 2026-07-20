# nixconf

# Welcome to my nixos configuration

My neovim configuration is finally ready as a wrap, you can try/use it with:
```sh
nix run github:Nielunix/nixconf#neovim
```

> [!Warning]
> Remember to change the hardware file with your hardware file,
> you cannot copy paste the file directly due to how I structured my config, so you must edit the text manually
>
>Also right now the config cannot be copied and paste entirely because uf the user directorie, I must change this in the future but I have a script to use hyprpicker copy the thing and send a notification where I use a direct path so if the user files are not the exact same you must change it yourself (or just remove/chnage the keybind in hyprland from where it is called).
> And When I write this it is not the case but I might add ipc calls from quickshell to this configuration in the hyprland keybinds but the Quickshell config is not in this repo but in the dracoshell repo listed bellow, but this is probably a temporary issue because maybe I will be able to import with a flake.


## Todo List
- [ ] restructure the config correctly
- [ ] find a theme for my system and make it for the system and my quickshell config: <a href='https://github.com/Nielunix/dracoshell'>dracoshell<a></br>
- [ ] add and make a flake input for my quickshell
- [ ] try to make scripts work even if the user is different

## Inspiration has been taken from:

<a href='https://github.com/vimjoyer/'>VimJoyer</a></br>
<a href='https://birdeehub.github.io/nix-wrapper-modules/'>birdeehub nix-wrapper-modules</a></br>
