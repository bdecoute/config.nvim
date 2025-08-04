# NEOVIM Getting started at NI Leuven

I advice those interested in vim to get started by using the vim motions in there current editor.
If this is frustrating, you won't have a good time with having vim as your editor.

Also important concideration is your reasons for switching.
Take into account that an unconfigured (neo)vim installation is not userfriendly to beginners or people not interested in learning how all the bits and pieces of (neo)vim work.
Diving into all the options, api, and features, can be fun. But this is definitaly not part of your day job. It quickly becomes a hobby.

Preconfigured distributions make this experience much better if you're not interested in understanding the (neo)vim way of working.
These preconfigured- or neovim distributions are feature rich and rival and flat out beat vs-code in user-friendlyness and features and productivity.

> [!WARNING]
> But the downside is that they will never be as stable and reliable as vs-code (eg)

The most important reason to switch to neovim as your daily editor, is the ability to personalize everything!
Instead of adapting your own way of working to what vs-code developers deemed apropriate, and be forever a slave to the Microsoft overlords, you can chose and set how you want to work.

> [!TIP]
> I advice beginners to start with [neovim kickstart](https://github.com/nvim-lua/kickstart.nvim)  
> This aims to not be a distribution but provide all the quality of life beginners could appreciate and sets popular extentions to neovim.  
> While also aiming to educate the user on what each line in the config does. This empowers the user to take control of there own development experience.

> [!TIP]
> Please read the entire kickstart code starting from `init.lua`  
> Understanding and being able to adapt neovim to your needs is the biggest benefit of using neovim


> [!NOTE]
> I'd prefer to be as agnostic as possible. But to make my recipes easier to use, I'll assume you're starting from kickstart.nvim.

## Prerequisites

Follow the [neovim kickstart](https://github.com/nvim-lua/kickstart.nvim) install instructions.
 > [!NOTE]
 > Take note of their prerequisits.

Run `:checkhealth` and solve the issues that rise up.

> [!NOTE]
> warnings under optional sections can be ignored if you don't care about them.
> eg. Ruby stuff you can ignore if you're not working with Ruby

## My Recommendations for work at NI-Leuven: 

Things that help me alot at my job here:
1. Lazygit
1. Python Language Server
1. C C++ Language Server
1. MarkDown Preview
1. Copilot

### Lazygit

Lets get started with an easy to use, powerfull git TUI with vim motions build-in.

This is a TUI independant from neovim.
Find its project on github: [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)

The package that allows you to open lazygit from within neovim is: [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
After reading and understanding the kickstart.nvim configuration and the readme of lazygit.nvim You're definitaly able to install lazygit yourself.

#### First. Install Lazygit.
```bash
sudo pacman -S lazygit
```

If you forget this step. No worries. lazygit.nvim will notify you when it is not installed. It is a quick fix.

#### Second install lazygit.nvim
In your `require('lazy').setup` table add: 
```lua
  { -- Lazygit
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
```

That is all!



### Python Language Server

Simply uncomment `pyright = {}`
```lua
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --
```

> [!NOTE]
> Mason will try to install 'pyright' but it requires npm to be installed.
> Mason is convenient enough to allow it npm to be installed.
> if you do not want this, you can install pyright yourself.  
> Read the readme of 'neovim/nvim-lspconfig'

```bash
sudo pacman -S npm
```

### C and C++ Language Server

```lua
      local servers = {
        clangd = {},
        -- gopls = {},
        pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --
```

Getting 'clangd' to work properly requires a bit more work.
Make sure the project compiles where you're editing (this is not straight forward)

Set `CMAKE_EXPORT_COMPILE_COMMANDS`
```
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
```

> [!NOTE]
> alternatively, create compile commands on sbrio, copy this and change the path of all the linked files!  
> This is not perfect and requires manual editing


