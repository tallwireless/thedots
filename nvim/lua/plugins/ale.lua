return {
    'dense-analysis/ale',
    config = function ()
        vim.g['ale_linters'] = { python = {'ruff'},
                                 jinja = {'j2lint  -i S3 S2 S7 S6 S5 --'},
                                ["*"] = {} }
        vim.g['ale_fixers'] = { ["*"] = {'remove_trailing_lines', 'trim_whitespace'},
                                jinja = {'djlint'}, }
                                ---python = {'ruff', 'black'}, }
        vim.g['ale_fix_on_save'] = 1
        vim.g['ale_sign_column_always'] = 1

        vim.keymap.set("n", "<F10>", vim.cmd(':ALEFix'))
    end

}