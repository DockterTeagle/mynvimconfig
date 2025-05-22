{inputs', ...}: {
  treefmt = {
    flakeFormatter = true;
    programs = {
      alejandra = {
        enable = true;
        package = inputs'.alejandra.packages.default;
      };
      stylua.enable = true;
      mdformat.enable = true;
      # dprint = {
      #   enable = true;
      #   includes = ["*.md"];
      #   settings = {
      #     useTabs = false;
      #     incremental = true;
      #     plugins = ["https://plugins.dprint.dev/markdown-0.18.0.wasm"];
      #   };
      # };
    };
  };
}
