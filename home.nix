{ configs, pkgs, ... }:
{



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

  home.file = {
    ".config/redis/redis.conf" = {
      source = ./redis/redis.conf;
    };
  };


  home.file = {
    "Hackey/Sharkey/.config/default.yml" = {
      source = ./Hackey/default.yml;
    };
  };


  systemd.user.services = {

    Hackey = {
      Unit = {
        Description = "Hackey instance";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "pnpm start";
        WorkingDirectory = "/home/vic/Hackey/Sharkey";
        Environment = [
          "NODE_ENV=production" 
          "NODE_OPTIONS=--max-old-space-size=2048" 
          "MK_CONFIG_DB_PASS_FILE=/home/vic/.config/pass"
        ];
        SyslogIdentifier = "hackey";
        Restart = "always";
        TimeoutSec = 60;
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };

  };


  programs.home-manager.enable = true;
  
} 