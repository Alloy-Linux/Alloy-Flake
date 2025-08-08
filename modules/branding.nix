{ config, pkgs, lib, version, ... }:

{
  environment.etc."os-release".text = lib.mkForce ''
    NAME="Alloy Linux"
    ID=alloy
    PRETTY_NAME="Alloy Linux ${version}"
    VERSION="${version}"
    VERSION_ID="${version}"
    VERSION_CODENAME=warbler
    BUILD_ID="${version}"
    BUG_REPORT_URL="https://github.com/Alloy-Linux/Alloy-Flake/issues"
    VENDOR_NAME="Alloy Linux"
    VENDOR_URL="https://github.com/Alloy-Linux"
    LOGO="nix-snowflake"
    HOME_URL="https://github.com/Alloy-Linux"
    DOCUMENTATION_URL="https://github.com/Alloy-Linux/wiki"
    SUPPORT_URL="https://github.com/Alloy-Linux/issues"
    ANSI_COLOR="0;38;2;126;186;228"
    DEFAULT_HOSTNAME=alloy
    CPE_NAME="cpe:/o:alloy:alloy:${version}"
  '';
}
