" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/valio/plugins.lua source <afile> | PackerCompile
augroup END
