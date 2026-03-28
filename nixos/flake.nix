{
  description = "NixOS configuration with unstable channel";

  inputs = {
    # Основной unstable канал
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Дополнительно можно добавить stable канал для отдельных пакетов
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    # Аппаратное обеспечение (опционально)
    hardware.url = "github:NixOS/nixos-hardware";
    
    # Домашний менеджер (опционально)
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, hardware, home-manager, ... }@inputs: {
    # Конфигурация для хоста "nixos"
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # или "aarch64-linux" для ARM
      
      # Специальные аргументы, доступные во всех модулях
      specialArgs = {
        inherit inputs;
        # Явно передаем unstable как основной
        pkgs-unstable = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        # Стабильный канал для отдельных случаев
        pkgs-stable = import nixpkgs-stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      
      modules = [
        # Основная конфигурация системы
        ./configuration.nix
        
        # Аппаратное обеспечение (раскомментируй если нужно)
        # hardware.nixosModules.common-cpu-amd
        # hardware.nixosModules.common-gpu-nvidia
        
        # Домашний менеджер (раскомментируй если нужно)
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.users.username = import ./home.nix;
        # }
      ];
    };
  };
}
