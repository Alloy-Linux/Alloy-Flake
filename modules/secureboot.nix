{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
    niv
  ];
  
  system.activationScripts.secureboot = {
    text = ''
    '';
  };

  boot.bootspec.enable = true;

  systemd.services.enroll-keys = {
    description = "enroll keys";
    wantedBy = [ "multi-user.target" ];
    script = ''
      sbctl enroll-keys --microsoft
    '';
  };


  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

}
