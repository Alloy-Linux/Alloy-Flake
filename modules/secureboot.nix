{ config, pkgs, lib ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
    niv
  ];
  
  system.activationScripts.secureboot = {
    text = ''
      if [[ -d "/var/lib/sbctl" ]]; then
        sudo sbctl create-keys
      else
        sbctl keys are already setup
      fi

    '';
  };


  systemd.services.enroll-keys = {
    description = "enroll keys";
    wantedBy = [ "multi-user.target" ];
    script = ''
      sudo sbctl enroll-keys --microsoft
    '';
  };


  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

}
