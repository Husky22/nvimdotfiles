local wk = require('which-key')

wk.setup()
wk.register({
        f = {
            name = "Files",
            s = {':w<cr>', 'Save File'},
            b = {'<cmd>NvimTreeOpen<cr>', 'Browse Tree'},
            f = {function()

                local handle = io.popen("git rev-parse --show-toplevel")
                local git_root = handle:read("*a")
                handle:close()
                print(git_root)
                require'fzf-lua'.files({cwd=git_root})
            end
            , 'find in git'},
            g = {"<cmd>FzfLua live_grep<cr>", 'grep git'},
            d = {"<cmd>NvimTreeOpen<cr>", 'tree'},
            t = {':lua require"fzf-lua".tags({fzf_args="--delimiter=: --with-nth=2 "})<cr>', 'tags'},
            o = {'<cmd>NvimTreeFindFileToggle<cr>', 'Nvim Tree'},
            r = {'<cmd>History<cr>', 'History'},
            w = {'<cmd>FzfLua grep_cword<cr>', 'word under cursor'},
            i = {
                name = "in",
                h = {'<cmd>FZF ~<cr>', 'Home'},
                f = {'<cmd>Files %:p:h<cr>', 'Git'},
                c = {':Files ~/.config<cr>', 'Configs'},
                C = {':Rgc<cr>', 'Rg Configs'},
                d = {':Rgn<cr>', 'Vimrc'},
                b = {':BTags<cr>', 'tags-in-buffer'},
                l = {':FzfLua lsp_live_workspace_symbols<cr>', 'tags'},
            },
            e = {
                name = "VIMRC",
                d = {':e $MYVIMRC<cr>', 'Edit .vimrc'},
                r = {':ReloadConfig<cr>', 'Reload .vimrc'},
                v = {':e ~/.config/nvim/lua/niklas/whichkey.lua<cr>', 'which-key Config'},
            },
        },
    }, {prefix = '<leader>'})

wk.register({
        g = {
            name = "Git",
            g = { ':Neogit<cr>'     , 'Status' },
            F = { ':Git fetch<cr>'     , 'fetch' },
            B = { ':FzfLua git_branches<cr>'     , 'Branches' },
            S = { ':FzfLua git_stash<cr>'     , 'Stash' },
            p = { ':Git pull<cr>'     , 'pull' },
            P = { ':Git push<cr>'     , 'push' },
            t = { ':GV!<cr>'     , 'file-tree' },
            T = { ':GV<cr>'     , 'rep-tree' },
            d = { ':GFiles?<cr>'     , 'diff-list' },
            b = { ':Gitsigns toggle_current_line_blame<cr>'     , 'toggle-blame' },
            h = {
                name = "Hunk",
                n = { ':Gitsigns next_hunk<cr>', 'next-hunk' },
                p = { ':Gitsigns prev_hunk<cr>', 'prev-hunk' },
                u = { ':Gitsigns reset_hunk<cr>', 'undo-hunk' },
                s = { ':Gitsigns stage_hunk<cr>', 'stage-hunk' },
                v = { ':Gitsigns preview_hunk<cr>', 'view-hunk' },
            },
        },
    }, {prefix = '<leader>'})

--wk.register({
--        h = {
--            name = "Harpoon",
--            s = { require("harpoon.ui").toggle_quick_menu, 'show-all' },
--            a = { require("harpoon.mark").add_file, 'add-file' },
--        },
--    }, {prefix = '<leader>'})

wk.register({
        s = {
            name = "Search",
            b = { ':Lines<cr>', 'Buffers' },
        },
    }, {prefix = '<leader>'})

wk.register({
        r = {
            name = "Refactor",
            b = "Extract Block",
	    v = {"Extract Variable", mode="v"},
	    v = {"Print Variable", mode="n"},
        },
    }, {prefix = '<leader>'})

wk.register({
        P = {
            name = "Plugins",
            i = { ':PackerSync<cr>'      , 'install-plugins' },
            c = { ':PlugClean<cr>'        , 'clean-plugins' },
            u = { ':PlugUpdate<cr>'       , 'update-plugins' },
            U = { ':PlugUpgrade<cr>'      , 'upgrade-VimPlug' },
        },
    }, {prefix = '<leader>'})

--wk.register({
--        l = {require("lsp_lines").toggle, 'toggle error descriptions'},
--    }, {prefix = '<localleader>'}
--    )


wk.register({
        w = {
            name = "Windows",
            w = { '<C-W>w'     , 'other-window' },
            o = { '<C-W><C-O>'     , 'only-window' },
            p = { ':TmuxNavigatePrevious<cr>'     , 'previous-window' },
            d = { '<C-W>c'     , 'delete-window' },
            ["-"] = { '<C-W>s'     , 'split-window-below' },
            ["/"] = { '<C-W>v'     , 'split-window-right' },
            ["2"] = { '<C-W>v'     , 'layout-double-columns' },
            h = { '<C-W>h'     , 'window-left' },
            j = { '<C-W>j'     , 'window-below' },
            l = { '<C-W>l'     , 'window-right' },
            k = { '<C-W>k'     , 'window-up' },
            H = { '<C-W>5<'    , 'expand-window-left' },
            J = { ':resize +5<cr>'  , 'expand-window-below' },
            L = { '<C-W>5>'    , 'expand-window-right' },
            K = { ':resize -5<cr>'  , 'expand-window-up' },
            ["="] = { '<C-W>='     , 'balance-window' },
            s = { '<C-W>s'     , 'split-window-below' },
            v = { '<C-W>v'     , 'split-window-below' },
        },
    }, {prefix = '<leader>'})

wk.register({
        b = {
            name = "Buffers",
            b = {":FzfLua buffers<cr>", 'find-buffer' },
            n = { ':bn<cr>'             , 'next-buffer' },
            p = { ':bp<cr>'             , 'prev-buffer' },
            d = { ':bd<cr>'             , 'delete-buffer' },
            s = { ':Lines<cr>', 'search-buffers' },
        },
    }, {prefix = '<leader>'})

wk.register({
        q = {
            name = "Quit",
            q = { ':q<cr>'     , 'quit' },
            Q = { ':q!<cr>'     , 'force-quit' },
            s = { ':wq<cr>'     , 'quit-save' },
        },
    }, {prefix = '<leader>'})

wk.register({
        T = {
            name = "Tests",
        },
    }, {prefix = '<leader>'})

wk.register({
        c = {
            name = "Comment",
	    c = { 'toggle comment', mode = "n" },
	    c = { 'toggle comment', mode = "v" }
        },
    }, {prefix = '<leader>'})
