{
  description = "Config...";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
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
      nixpkgs-stable,
      home-manager,
      mangowm,
      firefox-addons,
      fcitx5-im-emoji-picker,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          firefox-addons.overlays.default
          fcitx5-im-emoji-picker.overlays.default
        ];
      };
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          firefox-addons.overlays.default
          fcitx5-im-emoji-picker.overlays.default
        ];
      };
    in
    {
      nixosConfigurations.TNonggChann-no-PC = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            system
            pkgs-stable
            ;
        };
        modules = [
          { nixpkgs.pkgs = pkgs; }
          ./nixos/configuration.nix
          mangowm.nixosModules.mango
        ];
      };
      homeConfigurations.TNonggChann = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          ./home-manager/TNonggChann.nix
          mangowm.hmModules.mango
        ];
        extraSpecialArgs = {
          inherit pkgs-stable;
        };
      };
    };
}
