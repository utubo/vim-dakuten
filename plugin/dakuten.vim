vim9script

nnoremap <Plug>(dakuten) <ScriptCmd>&opfunc = 'dakuten#Inc'<CR>g@l
vnoremap <Plug>(dakuten) :keepp s/\(\(\%V.\)\+\)/\=dakuten#GetNext(submatch(1))/g<CR>

const key = get(g:, 'dakuten_key', '<Leader>d')
if !!key
  execute $'nnoremap {key} <Plug>(dakuten)'
  execute $'vnoremap {key} <Plug>(dakuten)'
endif
