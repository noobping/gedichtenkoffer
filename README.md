# Gedichtenkoffer

[Gedichtenkoffer](https://gedichtenkoffer.nl/)  is een website waarop je allerlei gedichten kunt lezen.

## Zelf een gedicht toevoegen

Wil je zelf een gedicht toevoegen? Dat doe je via [Github](https://github.com/gedichtenkoffer/gedichtenkoffer).
Maak daarvoor een nieuw bestand aan in de map `content/gedichten`. De naam van het bestand moet eindigen op `.md` (dat is een soort tekstbestand).

De instellingen van de website staan in het bestand `config.toml`. Hier kun je dingen aanpassen, zoals de titel en beschrijving van de site.

## Een afbeelding toevoegen

Wil je een plaatje bij je gedicht? Zet het plaatje dan in dezelfde map als je gedichtbestand.
Gebruik daarna deze regel om de afbeelding in je gedicht te laten zien:

```markdown
![beschrijving van de afbeelding](naam-van-de-afbeelding.jpg)
```

Vervang beschrijving van de afbeelding en naam-van-de-afbeelding.jpg door wat bij jouw plaatje past.

## Status van de website

De website wordt automatisch bijgewerkt als er iets verandert. Dat gebeurt elke keer als iemand een wijziging maakt in de bestanden op Github. De onderstaande badge laat zien of de laatste update goed is gegaan. Groen betekent dat alles goed is, rood betekent dat er een probleem is.

[![GitHub Pages](https://github.com/noobping/zola-template/actions/workflows/pages.yml/badge.svg)](https://github.com/noobping/zola-template/actions/workflows/pages.yml)
