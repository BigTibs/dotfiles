require("noice").setup({
    -- Ensure confirmation popups have sufficient space
    views = {
        confirm = {
            backend = "popup",   -- Use the popup backend
            relative = "editor", -- Center relative to the editor window
            position = {
                row = "50%",     -- Center vertically
                col = "50%",     -- Center horizontally
            },
            size = {
                width = "auto",  -- Width of the confirm popup
                height = "auto", -- Height of the confirm popup (adjust for visibility)
            },
            border = {
                style = "rounded", -- Rounded border for the confirm popup
                padding = { 0, 1 },
            },
            win_options = {
                winblend = 0, -- Ensure it's fully opaque
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
        },
        -- Notification Popup Configuration (ensure enough space for notifications)
        notify = {
            backend = "popup",   -- Use the popup backend
            relative = "editor", -- Position relative to the editor
            position = {
                row = "90%",     -- Position near the bottom of the editor
                col = "50%",     -- Center horizontally
            },
            size = {
                width = "auto",  -- Ensure enough space for notification content
                height = "auto", -- Adjust height dynamically based on content
            },
            border = {
                style = "rounded",  -- Optional: rounded border style
                padding = { 0, 1 }, -- Optional: padding around the text
            },
            win_options = {
                winblend = 10, -- Add slight transparency for aesthetics
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
            timeout = 3000
        },
    },
})
