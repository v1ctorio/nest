{ pkgs, ... }:

{

  systemd.user.services = {

    LifxAdmin = {
      Unit = {
        Description = "LifxAdmin bot";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "yarn start";
        SyslogIdentifier = "LIFXA";
        Restart = "always";
        TimeoutSec = 0;
        WorkingDirectory = "/home/vic/prjcts/lifx-admin";
        Environment = [
          "NODE_ENV=production" 
          "REDIS_PORT=44945" 
          "LIFXA_REDIS_DB="
        ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };

  };
}