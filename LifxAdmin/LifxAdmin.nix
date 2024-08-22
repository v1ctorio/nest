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
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };

  };
}