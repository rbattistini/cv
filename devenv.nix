{ pkgs, lib, config, ... }: {
  packages = with pkgs; [
      just
  ];

  languages = {
    typst.enable = true;
  };
}
