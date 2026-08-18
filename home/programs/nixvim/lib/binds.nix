# keymap helper, adapted from nvf's lib/binds.nix
# https://github.com/NotAShelf/nvf/blob/main/lib/binds.nix
{
  mkKeymap = mode: key: action: opts: {
    inherit mode key action;
    options = opts;
  };

  # like mkKeymap, but the action is a raw lua string
  mkRawKeymap = mode: key: raw: opts: {
    inherit mode key;
    action = {
      __raw = raw;
    };
    options = opts;
  };

  # like mkRawKeymap, but the action is a lua call on a plugin module:
  # function() require('plugin').action end
  # usage: mkPluginKeymap mode key [plugin action] opts
  # action should include parentheses if calling a function, e.g., "buffers()" or "pickers.lsp({ scope = 'references' })"
  mkPluginKeymap = mode: key: call: opts: let
    plugin = builtins.elemAt call 0;
    action = builtins.elemAt call 1;
  in {
    inherit mode key;
    action = {
      __raw = "function() require('${plugin}').${action} end";
    };
    options = opts;
  };
}
