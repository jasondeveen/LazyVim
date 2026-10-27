return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roslyn_ls = {
          root_dir = function(bufnr, on_dir)
            local file = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr)):gsub("\\", "/"):lower()

            local repo, branch = file:match("^(c:/_source/_git/iam/stl%-coordinatiemodel)/(csf2?)/")

            if repo then
              local solution = repo .. "/" .. branch .. "/AMG/Code/Shared/Solutions/CSF.All/CSF.All.sln"

              if vim.uv.fs_stat(solution) then
                on_dir(vim.fs.dirname(solution))
                return
              end
            end

            -- Other repos: find the nearest .sln or .slnx above the file.
            local root = vim.fs.root(bufnr, function(name)
              return name:lower():match("%.slnx?$") ~= nil
            end)

            if root then
              on_dir(root)
            end
          end,
        },
      },
    },
  },
}
