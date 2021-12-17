{ pkgs ? import <nixpkgs> { } }:
let
  inherit (pkgs) lib;
  source = lib.importJSON ./src.json;
in
pkgs.mpv-unwrapped.overrideAttrs (_: {
  src = pkgs.fetchFromGitHub {
    owner = "mpv-player";
    repo = "mpv";
    rev = source.rev;
    sha256 = source.sha256;
  };
  pname = "mpv-git";
  version = source.rev;
})
