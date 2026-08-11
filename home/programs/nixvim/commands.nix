{
  userCommands = {
    # find a project and cd into it, usable via `nvim -c FindProject`
    FindProject = {
      desc = "Find Project (cd)";
      command.__raw = ''
        function(opts)
          local fzf_lua = require("fzf-lua")
          opts = opts or {}
          opts.prompt = "Projects> "
          opts.cwd = opts.cwd or vim.fn.expand("~/Projects")
          opts.actions = {
            ["default"] = function(selected)
              local dir = opts.cwd .. "/" .. selected[1]
              vim.cmd("cd " .. vim.fn.fnameescape(dir))
              vim.cmd("edit .")
            end,
          }
          fzf_lua.fzf_exec("fd --type d --max-depth 1 --format '{/}'", opts)
        end
      '';
    };
  };
}
