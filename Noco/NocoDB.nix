{ pkgs, ...}:{



  systemd.user.services = {
    Noco = {
      Unit = {
        Description = "Vics noco instance";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "pnpm start";
        WorkingDirectory = "/home/vic/Noco";
        Environment = [
          "PORT=43595" 
          "NC_REDIS_URL=redis://localhost:44945/4"
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
}