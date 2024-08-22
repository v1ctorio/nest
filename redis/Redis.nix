{ pkgs, ... }:

{
  home.file = {
    ".config/redis/redis.conf" = {
      source = ./redis.conf;

    };
  };

  systemd.user.services = {

    Redis = {
      Unit = {
        Description = "Vic's redis";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "redis-server .config/redis/redis.conf";
        SyslogIdentifier = "hackey";
        Restart = "always";
        TimeoutSec = 0;
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