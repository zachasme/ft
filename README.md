# Helpful links

https://www.ft.dk/da/dokumenter/aabne_data#C1C823BA157D43669D3DFE0900BCCBC2

# Findings from the ODA backup

- The 5 tables `Almdel`, `Aktstykke`, `Debat`, `EUsag`, & `Forslag` are not used. They were intended to be specific types of `Sag`. Use `Sag` instead, filtering by `Sagstype`.

- The table `IdMap` is an internal mapping table used for maintenance.

# Conventions

We're importing the ODA database directly, with minor tweaks:
 - `type` column becomes `typenavn`
 - `id` column prefix becomes `_id`

But everything is in danish, which means some of the inflections become wierd.

The system we're going with is the following:

 - Models are in danish
 - The pluralization is danglish (ie. "Dokumenters")
 - Controllers are in english
 - Instance variables (for sending to views) is in danglish