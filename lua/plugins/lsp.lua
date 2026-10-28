return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roslyn_ls = {
          root_dir = function(bufnr, on_dir)
            -- CSF: get all sln
            -- local file = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr)):gsub("\\", "/"):lower()

            -- local repo, branch = file:match("^(c:/_source/_git/iam/stl%-coordinatiemodel)/(csf2?)/")

            -- if repo then
            --   local solution = repo .. "/" .. branch .. "/AMG/Code/Shared/Solutions/CSF.All/CSF.All.sln"

            --   if vim.uv.fs_stat(solution) then
            --     on_dir(vim.fs.dirname(solution))
            --     return
            --   end
            -- end

            -- Other repos: solution above the file, then project, then Git root.
            local solution_root = vim.fs.root(bufnr, function(name)
              return name:lower():match("%.slnx?$") ~= nil
            end)

            local project_root = vim.fs.root(bufnr, function(name)
              return name:lower():match("%.csproj$") ~= nil
            end)

            local root = solution_root or project_root or vim.fs.root(bufnr, ".git")

            if root then
              on_dir(root)
            end
          end,
        },
      },
    },
  },
}
