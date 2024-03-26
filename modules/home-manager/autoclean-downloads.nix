{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.services.autoclean-downloads;
  cleanDownloads = pkgs.writeShellScript "clean-downloads" ''
    #!/usr/bin/env bash
    echo "Deleting stale files in ${cfg.target}..."
    files=$(${pkgs.findutils}/bin/find "${cfg.target}" -type f -mtime "+${toString cfg.age}" -print -delete)
    echo "Deleted $files"
  '';
in
{
  options.services.autoclean-downloads = {
    enable = mkEnableOption "Auto-clean old files from Downloads";
    age = mkOption {
      type = types.int;
      default = 14;
      description = ''
        Age (in days) at which files should be deleted.
      '';
    };
    runTimes = mkOption {
      type = types.str;
      default = "daily";
      description = ''
        At what times the service should be run. 
        See `systemd.timer(5)` for details.
        And `systemd.time(7)` for format.
      '';
    };
    target = mkOption {
      type = types.str;
      default = "$HOME/Downloads";
      description = ''
        Target directory to delete files in.
      '';
    };
  };
  config = mkIf cfg.enable {
    systemd.user = {
      services.autoclean-downloads = {
        Unit = {
          Description = "Auto-clean old files from ${cfg.target}";
        };
        Service = {
          Type = "simple";
          ExecStart = "${cleanDownloads}";
        };
      };
      timers.autoclean-downloads = {
        Unit = {
          Description = "Auto-clean old files from ${cfg.target}";
        };
        Timer = {
          OnCalendar = cfg.runTimes;
          RandomizedDelaySec = 300;
          Persistent = true;
        };
        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
    };
  };
}
