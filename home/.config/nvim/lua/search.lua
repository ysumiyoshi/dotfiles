vim.opt.wrapscan = true -- 検索がファイル末尾まで進んだら先頭から再び検索する
vim.opt.hlsearch = true -- 検索結果をハイライト表示する
vim.opt.ignorecase = true -- 検索時大文字と小文字を区別しない
vim.opt.smartcase = true -- 大文字が含まれる場合、大文字と小文字を区別しない
vim.opt.incsearch = true -- 検索時入力ごとに検索していく
vim.opt.inccommand = "split" -- 検索置換のリアルタイムプレビューを有効にする 'split': スプリットを用意してプレビューを表示）, 'nosplit': 同じウィンドウでプレビューを表示、'': プレビューなし
