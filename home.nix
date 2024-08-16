{ configs, pkgs, ... }:
{

  imports = [
    ./redis/Redis.nix
    ./Hackey/Hackey.nix
  ];


  home.username = "vic";
  home.homeDirectory = "/home/vic";


  home.packages = [
    pkgs.helix #editor 
    pkgs.bat #modern cat
  ];

  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    PAGER = "less";
  };








  programs.home-manager.enable = true;
  
} 