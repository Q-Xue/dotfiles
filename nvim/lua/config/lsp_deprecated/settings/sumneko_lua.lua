return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
                preloadFileSize = 200,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
		},
	},
}
