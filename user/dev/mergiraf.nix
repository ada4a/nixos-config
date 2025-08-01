{ pkgs, ... }:
{
  home.packages = with pkgs; [ mergiraf ];

  programs.git = {

    extraConfig = {
      merge.mergiraf = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L --compact=true --fast";
      };
    };

    attributes = [ "* merge=mergiraf" ];
  };
}
