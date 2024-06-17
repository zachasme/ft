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