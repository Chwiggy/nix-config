{inputs, ...}: {
  pkg-sets = (
    final: prev: {
      stable = import inputs.nixpkgs-stable {system = final.system;};
    }
  );

  modifications = final: prev: {
    #   originally due to https://github.com/docker/compose/issues/12436, now only here as an example:
    #   docker-compose = prev.callPackage "${prev.path}/pkgs/applications/virtualization/docker/compose.nix" {
    #     buildGoModule = args:
    #       prev.buildGoModule (args
    #         // rec {
    #           version = "2.31.0";

    #           src = prev.fetchFromGitHub {
    #             owner = "docker";
    #             repo = "compose";
    #             rev = "v${version}";
    #             hash = "sha256-L+RDO31LnQbWA22bkCrnU2QDF6+eCPwbPpzZxHGrZ1Q=";
    #           };

    #           vendorHash = "sha256-IbDr2cTGmJZM8G2cj35CwfEX+DWVD0L4pUxHBvu9EfI=";

    #           ldflags = ["-X github.com/docker/compose/v2/internal.Version=${version}" "-s" "-w"];
    #         });
    #   };
  };
}
