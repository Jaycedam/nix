# keymap helper, adapted from nvf's lib/binds.nix
# https://github.com/NotAShelf/nvf/blob/main/lib/binds.nix
{
  mkKeymap = mode: key: action: opts: {
    inherit mode key action;
    options = opts;
  };
}
