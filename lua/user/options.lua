local options = {
    -- backups are for chickens
    backup = false,
    writebackup = false,
    swapfile = false,
    
    -- undo is acceptable though :D
    undofile = true,

    -- options I can't make meme descriptions for
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    pumheight = 10,
    termguicolors = true,

    -- people that set this to any value greater than 0 are savages
    conceallevel = 0,

    -- vim is now 24% smarter than me
    smartcase = true,
    smartindent = true,

    -- I'll never understand why these aren't the defaults
    splitbelow = true,
    splitright= true,

    -- I'm slow, but vim doesn't have to be.
    timeoutlen = 1000,
    updatetime = 300,
    
    -- four spaces or bust
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,

    -- Personally, I enjoy the visual landmarks of the cursorline and a colored
    -- column marker. The jury is still out on if I like 80 or 120.
    cursorline = true,
    colorcolumn = "120",
    
    -- The true vim mode
    number = true,
    relativenumber = true,
    showmode = false,
   
    -- The antithesis of the true vim mode
    mouse = "a",

    -- Basically make it vscode
    clipboard = "unnamedplus",
    showtabline = 2,

    -- Whenever the linter tells me a warning, I don't want the text to jump
    -- around the screen. Just leave the column on all the time.
    signcolumn = "yes",
    
    -- This may or may not be a good default setting. It really depends on how
    -- much prose I plan on writing.
    wrap = false,
    
    -- when scrolling up, down, and side to side, have at least N columns
    -- between the cursor and edge of the screen
    scrolloff = 8,
    sidescrolloff = 8,

    -- avoid having to press enter during ins-completion-menu messages
    shortmess = vim.opt.shortmess:append "c",

    -- allow the arrow keys, h, and l keys to move the cursor to the next line
    -- when on the first or last character
    whichwrap = vim.opt.whichwrap:append ",<,>,[,],h,l"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- st fix
vim.cmd [[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]]
vim.cmd [[let &t_8f = "\<Esc>[48;2;%lu;%lu;%lum"]]
