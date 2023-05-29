vim9script

const default_dict = [
  ['あ', 'ぁ'], ['い', 'ぃ'], ['う', 'ぅ'], ['え', 'ぇ'], ['お', 'ぉ'],
  ['か', 'が'], ['き', 'ぎ'], ['く', 'ぐ'], ['け', 'げ'], ['こ', 'ご'],
  ['さ', 'ざ'], ['し', 'じ'], ['す', 'ず'], ['せ', 'ぜ'], ['そ', 'ぞ'],
  ['た', 'だ'], ['ち', 'ぢ'], ['つ', 'づ', 'っ'], ['て', 'で'], ['と', 'ど'],
  ['は', 'ば', 'ぱ'], ['ひ', 'び', 'ぴ'], ['ふ', 'ぶ', 'ぷ'], ['へ', 'べ', 'ぺ'], ['ほ', 'ぼ', 'ぽ'],
  ['や', 'ゃ'], ['ゆ', 'ゅ'], ['よ', 'ょ'],
  ['ア', 'ァ'], ['イ', 'ィ'], ['ウ', 'ゥ'], ['エ', 'ェ'], ['オ', 'ォ'],
  ['カ', 'ガ', 'ヵ', 'ヶ', 'ケ', 'ゲ'], ['キ', 'ギ'], ['ク', 'グ'], ['コ', 'ゴ'],
  ['サ', 'ザ'], ['シ', 'ジ'], ['ス', 'ズ'], ['セ', 'ゼ'], ['ソ', 'ゾ'],
  ['タ', 'ダ'], ['チ', 'ヂ'], ['ツ', 'ヅ', 'ッ'], ['テ', 'デ'], ['ト', 'ド'],
  ['ハ', 'バ', 'パ'], ['ヒ', 'ビ', 'ピ'], ['フ', 'ブ', 'プ'], ['ヘ', 'ベ', 'ペ'], ['ホ', 'ボ', 'ポ'],
  ['ヤ', 'ャ'], ['ユ', 'ュ'], ['ヨ', 'ョ'],
  ['k', 'g'], ['s', 'z'], ['t', 'd'], ['h', 'b', 'p'],
  ['K', 'G'], ['S', 'Z'], ['T', 'D'], ['H', 'B', 'P'],
]

var initialized = false
def Init()
  if initialized
    return
  endif
  g:dakuten_dict = get(g:, 'dakuten_dict', []) + default_dict
  initialized = true
enddef

export def GetNext(c: string, step: number = 1): string
  Init()
  for d in g:dakuten_dict
    const p = index(d, c)
    if p !=# -1
      const l = len(d)
      return d[(p + step + l) % l]
    endif
  endfor
  return c
enddef

export def GetPrev(c: string): string
  return GetNext(c, -1)
enddef

export def Inc(motion: string)
  const c = matchstr(getline('.'), '.', col('.') - 1)
  const n = GetNext(c)
  execute 'normal! r' .. n
enddef

