{ config, pkgs, lib, ... }:

{
  environment.etc."os-release".text = lib.mkForce ''
    NAME="Alloy Linux"
    ID=alloy
    PRETTY_NAME="Alloy Linux 25.05/0.1"
    VERSION="25.05/0.1"
    VERSION_ID="25.05/0.1"
    VERSION_CODENAME=warbler
    BUILD_ID="25.05/0.1"
    BUG_REPORT_URL="https://github.com/Alloy-Linux/Alloy-Flake/issues"
    VENDOR_NAME="Alloy Linux"
    VENDOR_URL="https://github.com/Alloy-Linux"
    LOGO="nix-snowflake"
    HOME_URL="https://github.com/Alloy-Linux"
    DOCUMENTATION_URL="https://github.com/Alloy-Linux/wiki"
    SUPPORT_URL="https://github.com/Alloy-Linux/issues"
    ANSI_COLOR="0;38;2;126;186;228"
    DEFAULT_HOSTNAME=alloy
    CPE_NAME="cpe:/o:alloy:alloy:25.05/0.1"
  '';
}
