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
  };
  build = {
    check = self';
  };
}
