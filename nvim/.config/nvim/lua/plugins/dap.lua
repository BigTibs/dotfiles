return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
            'theHamsta/nvim-dap-virtual-text',
        },
        keys = {
            -- Debug controls
            { '<F5>',       function() require('dap').continue() end,                                             desc = 'Debug: Start/Continue' },
            { '<F8>',       function() require('dap').step_over() end,                                            desc = 'Debug: Step Over' },
            { '<F9>',       function() require('dap').step_into() end,                                            desc = 'Debug: Step Into' },
            { '<F10>',      function() require('dap').step_out() end,                                             desc = 'Debug: Step Out' },

            -- Breakpoints
            { '<Leader>b',  function() require('dap').toggle_breakpoint() end,                                    desc = 'Debug: Toggle Breakpoint' },
            { '<Leader>B',  function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Debug: Conditional Breakpoint' },

            -- Debug utilities
            { '<Leader>dr', function() require('dap').repl.open() end,                                            desc = 'Debug: Open REPL' },
            { '<Leader>dl', function() require('dap').run_last() end,                                             desc = 'Debug: Run Last' },
            { '<Leader>du', function() require('dapui').toggle() end,                                             desc = 'Debug: Toggle UI' },
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            -- Helper function to find Azure Function project root
            local function find_azure_function_root()
                local markers = { 'host.json', 'local.settings.json' }

                -- Start from current buffer's directory
                local current_file = vim.fn.expand('%:p:h')

                -- Search upwards from current file
                for _, marker in ipairs(markers) do
                    local root = vim.fn.findfile(marker, current_file .. ';')
                    if root ~= '' then
                        local project_root = vim.fn.fnamemodify(root, ':h')
                        print('Found Azure Function project at: ' .. project_root)
                        return project_root
                    end
                end

                -- If not found from current file, try from cwd
                local cwd = vim.fn.getcwd()
                for _, marker in ipairs(markers) do
                    local root = vim.fn.findfile(marker, cwd .. ';')
                    if root ~= '' then
                        local project_root = vim.fn.fnamemodify(root, ':h')
                        print('Found Azure Function project at: ' .. project_root)
                        return project_root
                    end
                end

                -- Last resort: prompt user
                print('Could not find host.json or local.settings.json')
                return vim.fn.input('Azure Function project root: ', cwd, 'dir')
            end

            -- Setup dap-ui
            dapui.setup()

            -- Setup virtual text
            require('nvim-dap-virtual-text').setup()

            -- Configure netcoredbg adapter
            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = { '--interpreter=vscode' }
            }

            -- Configure C# debugging for Azure Functions
            dap.configurations.cs = {
                -- {
                --     type = "coreclr",
                --     name = "Launch Azure Function",
                --     request = "launch",
                --     program = "func",
                --     args = { 'start', '--csharp' },
                --     cwd = find_azure_function_root,
                --     stopAtEntry = false,
                --     console = "externalTerminal",
                -- },
                {
                    type = "coreclr",
                    name = "Launch Azure Function",
                    request = "launch",
                    program = vim.fn.exepath('func') or 'func',
                    args = { 'start', '--csharp' },
                    cwd = find_azure_function_root,
                    stopAtEntry = false,
                    -- console = "externalTerminal",
                    console = "integratedTerminal",
                    -- env = vim.fn.environ(),
                    justMyCode = false,
                    requireExactSource = false,
                },
                {
                    type = "coreclr",
                    name = "Attach to Azure Function",
                    request = "attach",
                    processId = function()
                        return require('dap.utils').pick_process({
                            -- Function to find dotnet processes
                            filter = function(proc)
                                local name = proc.name:lower()

                                -- Must contain 'dotnet'
                                if not name:match('dotnet') then
                                    return false
                                end

                                -- Exclude build/dev tools
                                if name:match('msbuild')
                                    or name:match('vbcscompiler')
                                    or name:match('roslyn')
                                    or name:match('omnisharp')
                                    or name:match('languageserver')
                                    or name:match('codeanalysis') then
                                    return false
                                end

                                -- Only show processes with .dll and --host (Azure Functions pattern)
                                return name:match('%.dll') and name:match('%-%-host')
                            end
                        })
                    end,
                },
            }

            -- Auto-open/close UI on debug events
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}
