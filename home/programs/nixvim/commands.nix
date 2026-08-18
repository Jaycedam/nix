{
  userCommands = {
    # find a project and cd into it, usable via `nvim -c FindProject`
    Projects = {
      desc = "Change Project (cd)";
      command.__raw = ''
        function()
            local dirs = { "~/Projects" }
            local bases = vim.tbl_map(vim.fn.expand, dirs)
            local cmd = { "fd", ".", "--type", "d", "--max-depth", "1", "--absolute-path" }
            vim.list_extend(cmd, bases)
            local paths = vim.fn.systemlist(cmd)

            local items = {}
            for _, path in ipairs(paths) do
                path = vim.fs.normalize(path) -- fd appends trailing slash
                table.insert(items, { path = path, text = vim.fn.fnamemodify(path, ":~") })
            end

            vim.ui.select(items, {
                prompt = "Change Project > ",
                format_item = function(item)
                    return item.text
                end,
            }, function(item)
                if item ~= nil then
                    -- vim.cmd("silent! %bd!")
                    vim.cmd.cd(item.path)
                    vim.cmd.edit(".")
                end
            end)
        end
      '';
    };
  };
}
