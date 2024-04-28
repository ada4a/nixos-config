{}: {
  programs.neovim = {
    defaultEditor = true;
  };

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    extraPlugins = with pkgs.vimPlugins; [
      vim-tpipeline
    ];

    options = {
      clipboard = "unnamedplus";
      number = true;
      relativenumber = true;
      undodir = "./undo";
      undofile = true;
      fillchars = { eob = " "; };
      tabstop = 2;
      shiftwidth = 2;
      expandtab = false;
      wrap = false;

      laststatus = 3;
    };

    colorschemes.gruvbox.enable = true;

    globals = {
      mapleader = " ";
    };

    plugins = {
      barbecue.enable = true;
      bufferline.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      lsp-format.enable = true;
      lsp-lines.enable = true;
      lspkind.enable = true;
      nix.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      surround.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
        settings.mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
              cmp.mapping(
                function(fallback)
            if cmp.visible() then
             cmp.select_next_item()
            elseif luasnip.expandable() then
             luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
             luasnip.expand_or_jump()
            elseif check_backspace() then
             fallback()
            else
             fallback()
            end
                end
              ,
              { "i", "s" }
            )
          '';
        };
      };
      lint = {
        enable = true;
        lintersByFt = {
          text = [ "vale" ];
          json = [ "jq" ];
          markdown = [ "vale" ];
          nix = [ "alejandra" ];
        };
      };
      lsp = {
        enable = true;
        servers = {
          rnix-lsp.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
      lualine = {
        enable = true;
        theme = "base16";
        componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        inactiveSections = {
          lualine_a = null;
          lualine_b = null;
          lualine_c = null;
          lualine_x = null;
          lualine_y = null;
          lualine_z = null;
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "filename" "branch" ];
          lualine_c = [ "fileformat" ];
          lualine_x = [ "progress" ];
          lualine_y = [ "filetype" ];
          lualine_z = [ "location" ];
        };
      };
      nvim-tree = {
        enable = true;
        filters.custom = [
          ".git"
        ];
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
        };
      };
      treesitter = {
        enable = true;
        nixGrammars = true;
      };
    };

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
    ];
  };
}
