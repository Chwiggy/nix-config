{
  lib,
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "atkinson-hyperlegible-mono";
  version = "local-2025-02-15";

  src = ./source;

  # phases = ["installPhase"];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    install -v -Dm644 -t $out/share/fonts/truetype ./atkinson-hyperlegible-mono.ttf

    runHook postInstall
  '';

  meta = with lib; {
    description = "Atkinson Hyperlegible Mono: A monospace variant of Atkinson Hyperlegible";
    url = "https://www.brailleinstitute.org/freefont/";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [chwiggy];
  };
}
