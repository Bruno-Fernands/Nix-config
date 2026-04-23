{
	description = "hyprland on nixos";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};	
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};
	
	outputs = { nixpkgs, home-manager, zen-browser, helium, ... }: {
		nixosConfigurations.sadam = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
      specialArgs = { inherit zen-browser helium; };
			modules = [
				./hosts/computador/configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.sadam = import ./hosts/computador/home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	
	};

}
