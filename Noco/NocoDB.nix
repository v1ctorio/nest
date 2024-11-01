{ pkgs, ...}:{



  systemd.user.services = {
    Noco = {
      Unit = {
        Description = "Vics noco instance";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "nocodb";
        WorkingDirectory = "/home/vic/Noco";
        Environment = [
          "PORT=43595" 
          "NC_REDIS_URL=redis://localhost:44945/4"
        ];
        SyslogIdentifier = "nocodb";
        Restart = "always";
        TimeoutSec = 60;
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };
  };
}