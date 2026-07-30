{ pkgs, lib, ... }: {
  home.activation.reloadOpencode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.procps}/bin/pkill -USR2 opencode 2>/dev/null || true
  '';
}
