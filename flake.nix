{
  description = "Config...";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango/0.16.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "github:osipog/nix-firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fcitx5-im-emoji-picker = {
      url = "github:lillongg/nix-fcitx5-im-emoji-picker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      mangowm,
      firefox-addons,
      fcitx5-im-emoji-picker,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.TNonggChann-no-PC = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            system
            ;
        };
        modules = [
          ./nixos/configuration.nix
          mangowm.nixosModules.mango
        ];
      };
      homeConfigurations.TNonggChann = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            firefox-addons.overlays.default
            fcitx5-im-emoji-picker.overlays.default
          ];
        };
        modules = [
          ./home-manager/TNonggChann.nix
          mangowm.hmModules.mango
        ];
        extraSpecialArgs = {
        };
      };
    };
}
