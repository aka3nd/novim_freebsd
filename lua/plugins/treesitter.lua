return{
  "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	
	cfg = function()
	  require("nvim-treesitter.configs").setup({
	    highlight = {
	      enable = true,
	    },
	    indent = {
	      enable = true,
	      additional_vim_regex_highlighting = false,
	    },
	    autotag = {
	      enable = true,
	    },
	  })
	end,
}
