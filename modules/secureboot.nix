{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
    niv
  ];
  
  system.activationScripts.secureboot = {
    text = ''
      if ${pkgs.sbctl}/bin/sbctl status | grep -qE "Secure Boot:.*Enabled"; then
        echo "Secure boot is already enrolled"
        exit 0
      fi

      # Create secure boot keys and enroll to uefi
      ${pkgs.sbctl}/bin/sbctl create-keys

      if ${pkgs.sbctl}/bin/sbctl enroll-keys; then
        echo "Secure boot keys has been enrolled"
      else
        ${pkgs.sbctl}/bin/sbctl status
      fi
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
