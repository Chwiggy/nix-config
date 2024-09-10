# From https://gitlab.com/ada.loveless/nix/-/blob/master/modules/nixos/thunderbird.nix
{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.thunderbird;
  policyFormat = pkgs.formats.json {};
in {
  options.programs.thunderbird = {
    enable = lib.mkEnableOption "The Thunderbird E-Mail client";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.thunderbird;
      description = lib.mdDoc "Thunderbird package to use.";
      defaultText = lib.literalExpression "pkgs.thunderbird";
      relatedPackages = [
        "thunderbird-bin"
      ];
    };

    policies = lib.mkOption {
      type = policyFormat.type;
      default = {};
      description = lib.mdDoc ''
        Group policies to install.

        See Thunderbird's documentation for a list of available options.
      '';
    };
  };

  config = let
    policiesJSON = policyFormat.generate "policies.json" {inherit (cfg) policies;};
  in
    lib.mkIf cfg.enable {
      environment.systemPackages = [
        cfg.package
      ];
      environment.etc = lib.mkIf (cfg.policies != {}) {
        "thunderbird/policies/policies.json".source = "${policiesJSON}";
      };
    };
}
