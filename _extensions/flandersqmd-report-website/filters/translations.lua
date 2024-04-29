function is_empty(s)
  return s == nil or s == ''
end

function translation_entity(result, lang, entity)
  if (entity == "INBO") then
    if (lang == "nl-BE") then
      result.address = "INBO Brussel, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussel"
      result.city = "Brussel"
      result.mission = "Het INBO is het onafhankelijk onderzoeksinstituut van de Vlaamse overheid dat via toegepast wetenschappelijk onderzoek, data- en kennisontsluiting het biodiversiteitsbeleid en -beheer onderbouwt en evalueert."
      result.name = "Instituut voor Natuur- en Bosonderzoek"
      result.series = "Rapporten van het"
      result.url = "https://www.vlaanderen.be/inbo"
      result.url_text = "vlaanderen.be/inbo"
    elseif (lang == "fr-FR") then
      result.address = "INBO Bruxelles, Herman Teirlinckgebouw, Avenu du Port 88 boîte 73, 1000 Bruxelles"
      result.city = "Bruxelles"
      result.mission = "l'Institut de Recherche sur la Nature et les Forêts ('Instituut voor Natuur- en Bosonderzoek', INBO) est un institut de recherche indépendant du gouvernement flamand, qui étaye et évalue la politique et la gestion en matière de biodiversité par la recherche scientifique appliquée, l'intégration et la dissémination publique de données et de connaissances."
      result.name = "l'Institut de Recherche sur la Nature et les Forêts"
      result.series = "Rapports de"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    else
      result.address = "INBO Brussels, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussel"
      result.city = "Brussels"
      result.mission = "The Research Institute for Nature and Forest (INBO) is an independent research institute of the Flemish government. Through applied scientific research, open data and knowledge, integration and disclosure, it underpins and evaluates biodiversity policy and management."
      result.name = "Research Instute for Nature and Forest"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    end
    result.issn_nr = "1782-9054"
    result.vu_name = "Hilde Eggermont"
  else
    result.address = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.city = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.mission = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.name = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.url = ''
    result.url_text = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
  end
  return result
end

function translation(lang, entity)
  local result
  if (lang == "nl-BE") then
    result = {
      author = "Geschreven door",
      address = "Vlaamse overheid, Herman Teirlinckgebouw, Havenlaan 88, 1000 Brussel",
      citation = "Wijze van citeren",
      city = "Brussel",
      country = "België",
      depotnr = "Depotnummer",
      export = "Exporteer referentie als",
      location = "Vestiging",
      mission = "Hier komt de missie",
      ordernr = "Opdrachtnummer",
      reviewer = "Nagelezen door",
      series = "Rapporten van het",
      url = "https://www.vlaanderen.be",
      url_text = "vlaanderen.be",
      vu = "Verantwoordelijke uitgever",
      year = "Gepubliceerd in"
    }
  elseif (lang == "fr-FR") then
    result = {
      author = "Écrit par",
      address = "Autorité flamande, Herman Teirlinckgebouw, Avenu du Port 88, 1000 Bruxelles",
      citation = "Citation recommandée",
      city = "Bruxelles",
      country = "Belgique",
      depotnr = "Numéro de dépôt",
      export = "Exporter la référence à",
      location = "Adresse",
      mission = "Mission statement",
      ordernr = "Numéro de commande",
      reviewer = "Examiné par",
      series = "Rapports de",
      url = "https://www.vlaanderen.be/fr",
      url_text = "vlaanderen.be",
      vu = "Éditeur responsable",
      year = "Publié en"
    }
  else
    result = {
      author = "Written by",
      address = "Government of Flanders, Herman Teirlinck, Havenlaan 88, 1000 Brussel",
      citation = "Way of quoting",
      city = "Brussels",
      country = "Belgium",
      depotnr = "Deposit number",
      export = "Export reference to",
      location = "Location:",
      mission = "Misson statement",
      ordernr = "Order number",
      reviewer = "Reviewed by",
      series = "Reports of the",
      url = "https://www.vlaanderen.be/en",
      url_text = "vlaanderen.be",
      vu = "Responsible publisher",
      year = "Published during"
    }
  end
  return translation_entity(result, lang, entity)
end

function abbreviate_person(person, i, type, n)
  if i > 2 then
    return ''
  end
  if i == 2 and n > 2 then
    return ' et al.'
  end
  if (i > 1) then
    res = ' & '
  else
    res = ''
  end
  if is_empty(person.name) then
    res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
  else
    if is_empty(person.name.family) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
    if is_empty(person.name.given) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
    else
      local x = pandoc.utils.stringify(person.name.given)
      res = res .. ', ' .. string.gsub(x, '([A-Z])[a-zàçéèïîôö]*', '%1.')
    end
  end
  return res
end

function shortauthor(author)
  n = 0
  for i, person in pairs(author) do
    n = i
  end
  z = ''
  for i, person in pairs(author) do
    z = z .. abbreviate_person(person, i, 'author', n)
  end
  return z
end

return {
  {
    Meta = function(meta)
      if is_empty(meta.flandersqmd.entity) then
        meta.translation = translation(pandoc.utils.stringify(meta.lang), "INBO")
      else
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang), pandoc.utils.stringify(meta.flandersqmd.entity)
        )
      end
      if is_empty(meta.flandersqmd.author) then
        meta.shortauthor = pandoc.RawInline(
          "html",
          '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
        )
      else
        meta.shortauthor = shortauthor(meta.flandersqmd.author)
      end
      return meta
    end
  }
}
