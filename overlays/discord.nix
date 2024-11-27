# Discord Overlay Configuration
# <https://wiki.nixos.org/wiki/Discord>
_: {
  nixpkgs.overlays = let
    # <https://wiki.nixos.org/wiki/Discord#OpenAsar_.2F_Vencord>
    discord_OpenASAR_Vencord = _self: super: {
      discord = super.discord.override {
        withOpenASAR = true;
        withVencord = true;
      };
    };
  in [discord_OpenASAR_Vencord];
}
