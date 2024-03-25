return {
  "akinsho/flutter-tools.nvim",
  lazy = true,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    require("flutter-tools").setup({
      ui = { border = "rounded", notification_style = "native" },
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = true,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = true,
          -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
          -- this will show the currently selected project configuration
          project_config = true,
        },
      },
      root_patterns = { ".git", "pubspec.yaml" },
      debugger = {
        enabled = true,
        run_via_dap = true,
        fvm = true,
        dev_tools = {
          autostart = false,
          auto_open_browser = true,
        },
      },
    })

    require("flutter-tools").setup_project({
      {
        name = "main_production", -- an arbitrary name that you provide so you can recognise this config
        flavor = "production", -- your flavour
        target = "lib/main_production.dart", -- your target
        device = "emulator-5554",
        dart_define_from_file = ".vscode/launch.json", -- the path to a JSON configuration file
      },
      {
        name = "main_development", -- an arbitrary name that you provide so you can recognise this config
        flavor = "development", -- your flavour
        target = "lib/main_development.dart", -- your target
        device = "emulator-5554",
        dart_define_from_file = ".vscode/launch.json", -- the path to a JSON configuration file
      },
      {
        name = "main_staging", -- an arbitrary name that you provide so you can recognise this config
        flavor = "staging", -- your flavour
        target = "lib/main_staging.dart", -- your target
        device = "emulator-5554",
        dart_define_from_file = ".vscode/launch.json", -- the path to a JSON configuration file
      },
      {
        name = "main", -- an arbitrary name that you provide so you can recognise this config
        target = "lib/main.dart", -- your target
        device = "emulator-5554",
        dart_define_from_file = ".vscode/launch.json", -- the path to a JSON configuration file
      },
    })
  end,
}
