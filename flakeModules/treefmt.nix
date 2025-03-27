{
  inputs',
  self',
  ...
}: {
  flakeFormatter = true;
  programs = {
    alejandra = {
      enable = true;
      package = inputs'.alejandra.packages.default;
    };
    stylua.enable = true;
    mdformat.enable = true;
    typos = {
      enable = true;
      configFile = ".typos.toml";
    };
  };
  build = {
    check = self';
  };
}
