return {
    url = 'https://github.com/nvimdev/indentmini.nvim',
    cmd = { 'IndentToggle', 'IndentEnable', 'IndentDisable' },
    keys = {
        {'<F4>', '<Cmd>IndentToggle<CR>', desc = 'Toggle indent guides'},
    },
    lazy = true,
    config = function()
        require("indentmini").setup({
            only_current = false,
            enabled = false,
            char = '▏',
            key = '<F4>', -- optional, can be set here if you don't lazy-load
            minlevel = 2,
            exclude = { 'markdown', 'help', 'text', 'rst' },
            exclude_nodetype = { 'string', 'comment' }
        })
    end
}
