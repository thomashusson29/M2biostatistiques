-- Filtre Lua pour convertir les titres de niveau 6 en \subsubparagraph
function Header(el)
  if el.level == 6 and FORMAT:match 'latex' then
    -- Récupérer le texte du titre
    local text = pandoc.utils.stringify(el.content)
    -- Retourner un bloc LaTeX brut avec \subsubparagraph
    return pandoc.RawBlock('latex', '\\subsubparagraph{' .. text .. '}')
  end
  return el
end
