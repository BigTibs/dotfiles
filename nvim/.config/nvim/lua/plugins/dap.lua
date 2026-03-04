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
                {
                    type = "coreclr",
                    name = "Launch REST API (auto-detect)",
                    request = "launch",
                    program = function()
                        -- Auto-detect the main application DLL
                        local cwd = vim.fn.getcwd()
                        -- Cherche spécifiquement ton DLL principal
                        local project_name = vim.fn.fnamemodify(cwd, ':t') -- Nom du dossier actuel
                        local dll_path = cwd .. '/bin/Debug/net8.0/' .. project_name .. '.dll'

                        -- Vérifie si le fichier existe
                        if vim.fn.filereadable(dll_path) == 1 then
                            return dll_path
                        end

                        -- Sinon, demande à l'utilisateur
                        return vim.fn.input('Path to DLL: ', cwd .. '/bin/Debug/net8.0/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    env = {
                        ASPNETCORE_ENVIRONMENT = "Development",
                        ASPNETCORE_URLS = "http://localhost:5000;https://localhost:5001"
                    },
                    stopAtEntry = false,
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
