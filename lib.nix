{ pkgs }:

with pkgs.lib; {
  # Add your library functions here
  #
  # hexint = x: hexvals.${toLower x};
  wrapGL =
    let
      drivers = [ pkgs.mesa.drivers ];
      vaapiDrivers = [ pkgs.vaapiIntel ];
    in
    name: path: pkgs.writeShellScriptBin name ''
      export LIBGL_DRIVERS_PATH="${makeSearchPathOutput "lib" "lib/dri" drivers}"
      export LIBVA_DRIVERS_PATH="${makeSearchPathOutput "out" "lib/dri" vaapiDrivers}"
      export LD_LIBRARY_PATH="${makeLibraryPath drivers}"
      exec ${path} "$@"
    '';
}
