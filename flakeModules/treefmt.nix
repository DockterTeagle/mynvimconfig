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
    # typos.enable = true;
  };
  build = {
    check = self';
  };
}
