## Bootstrapping the system
1. add git - to clone the repo, but also for nix develop later
```
nix-shell -p git
```
2. clone the repo and cd into it
```
git clone https://github.com/ada4a/nixos-config .dotfiles && cd .dotfiles
```
3. move hardware-configuration.nix to the correct location
```
cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/system
```
4. load the bootstrapping devShell - has nh & home-manager
```
nix develop . --extra-experimental-features nix-command --extra-experimental-features flakes
```
5. build the system
  - can't switch right away because I'm changing the bootloader from grub (default) to systemd-boot
  - also provide the hostname because it's set to "nixos" while in nix-shell
```
sudo nixos-rebuild boot --flake .#magicbook
```
6. build the home
```
nh home switch .
```
7. switch to the newly-built system
```
sudo reboot
```
### TODOs after that
- import the SSH key from the secret location
- clone the [LazyVim config](https://github.com/ada4a/lazyvim)
```
git clone https://github.com/ada4a/lazyvim ~/.config/nvim
```
- finish setting up Syncthing - accept this device's requests on the other ones
