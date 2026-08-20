{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        section_separators = "";
        component_separators = "";
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            __unkeyed-1.__raw = ''
              function()
                  return "%#Directory#󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. "%*"
              end
            '';
          }
          "branch"
          "diff"
        ];
        lualine_c = ["filename" "diagnostics"];
        lualine_x = [
          {
            __unkeyed-1.__raw = ''
              function()
                  local reg = vim.fn.reg_recording()
                  if reg == "" then
                      return ""
                  end
                  return "%#@Macro#󰝥 rec: " .. reg .. "%*"
              end
            '';
          }

          "filetype"
        ];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
