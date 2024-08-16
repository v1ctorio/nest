{ pkgs, ... }:

{
  home.file = {
    ".config/redis/redis.conf" = {
      source = ./redis/redis.conf;

    };
  };

  systemd.user.services = {

    Redis = {
      Unit = {
        Description = "Vic's redis";
        After = [ "network-online.target" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "redis-server .config/redis/redis.conf";
        SyslogIdentifier = "hackey";
        Restart = "always";
        TimeoutSec = 0;
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

    };

  };
}