The engines' configs were stolen from multiple places:
- https://gitlab.com/kira-bruneau/nixos-config/-/blob/5d6ae0f48c4a4df901e2b4fc0f00ffb52d6f01c2/home/programs/firefox/default.nix
- default config: https://github.com/nix-community/home-manager/blob/master/modules/programs/firefox.nix#L534-L555
  
with following changes:
 - instead of defining URLs as template+params, just use the full URL with `{searchFields}` for brevity
 - don't use `icon` just to fetch the favicons into files - instead use `iconUpdateURL`
   - related: define a single `updateInterval` and use it for all the engines
