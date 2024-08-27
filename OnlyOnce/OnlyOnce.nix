{ pkgs, ... }:

{

  systemd.user.services = {

    OnlyOnce = {
      Unit = {
        Description = "Only Once slack";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "npm run bot";
        SyslogIdentifier = "OOSlack";
        Restart = "always";
        TimeoutSec = 0;
        WorkingDirectory = "/home/vic/prjcts/slack-only-once";
        Environment = [
          "NODE_ENV=production" 
        ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };

  };
}