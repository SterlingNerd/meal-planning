---
name: recipe-creator
description: Create, transcribe, or reformat recipes in the meal-planning recipe library. Covers the house markdown format (rating table, ingredients table, directions), collecting ratings from the cook, and estimating ratings when transcribing a recipe from the internet. Use when the user says "new recipe", "add a recipe", "next recipe", gives a list of ingredients and directions, pastes a recipe or URL from the internet, or asks to rate, reformat, or clean up a recipe.
---

# Recipe Creator

Recipes are the product of this repo. One recipe per markdown file in `recipes/`, kebab-case filename (`bacon-mac.md`, `leftovers-chili.md`).

## CRITICAL

- **Never invent ingredients, amounts, or steps the cook did not give.** A dictated recipe stays dictated. Ask instead of guessing.
- **Cook by theme, not by measurement.** Amounts stay loose ("—", "1 large can", "4–6 large") unless the cook supplies numbers. Do not add teaspoon-level precision, cook times, or food-safety notes the cook did not write.
- **Do not write code** — not Python, not PowerShell — unless explicitly asked to change sync scripts.
- **Check for an existing recipe first** (`ls recipes/`). Bacon Mac and Lazy Mac are different recipes; a variation on an existing dish usually belongs in that file's *Other Considerations*.

## Format

Match the existing files exactly. Template:

```markdown
# Recipe Name

|               |   |
|---------------|---|
| Rating        | 5 |
| Ease          | 2 |
| Quickness     | 3 |
| Affordability | 2 |

One short paragraph: what the dish is and why we make it.

# Ingredients

|Ingredient|Amount|Notes|
|-|-|-|
|Pasta|—|Any shape|
|Bacon|—|Cooked in the saucepan; leaves the grease for the roux|
|Salt and Pepper|||

# Directions

- One step per bullet, in order.

# Other Considerations

Substitutions, fixes for texture, storage/freezing, what to vary.
```

- Title in the H1 and the filename agree.
- Section order: rating table → blurb → `# Ingredients` → `# Directions` → `# Other Considerations`. Single `#` for every section.
- Ingredient table columns: `Ingredient|Amount|Notes`. Use `—` for "however much", blank for salt/pepper.
- Directions: plain bullets, present tense, imperative voice. Keep the cook's own phrasing ("stir occasionally until hungry") instead of tidying it into standard recipe language.
- Other Considerations is where the useful cook's knowledge goes: why not pre-shredded cheese, how to fix a sauce that split, what else could go in.
- If the recipe came from a URL, put the link in Other Considerations.

## Ratings

Four metrics, 1–5, always in the order Rating / Ease / Quickness / Affordability.

| Score | Rating | Ease | Quickness | Affordability |
|-|-|-|-|-|
| 5 | Family favorite | Very easy, minimal prep | Under 15 minutes | Budget-friendly |
| 4 | Very good, well-liked | Easy, straightforward | 15–30 minutes | Reasonable cost |
| 3 | Good, acceptable | Moderate technique | 30–60 minutes | Average cost |
| 2 | Okay, needs improvement | Challenging | 1–2 hours | Expensive |
| 1 | Not a favorite | Very difficult | 2+ hours | Premium ingredients |

**A recipe the cook dictated:** ask for the four ratings in the reply. If they answer, write the numbers. If they do not, leave `—` in all four rows and say the ratings are unset — never fill them in yourself.

**A recipe transcribed from the internet:** estimate all four using the table above, and say plainly in the reply which numbers are estimates ("guessed 4/3/2/4 — correct them after you cook it"). Estimates are guesses about a dish we have not eaten; they are not family history and must never be presented as such. Quickness counts hands-on time plus the wait we would walk away from (a crockpot chili is Easy 4, Quick 2).

If the cook gives conflicting or partial ratings, take the more specific pairing, say which one you used, and ask for the other.

## Before writing: catch the holes

Dictated recipes have gaps. Look for these, then fix them in the file **and** flag them in the reply:

- An ingredient that is cooked but never added back (bacon out of the pan, then never in the dish).
- Ingredient names that do not mean what they say ("condensed milk" in a cheese sauce is unsweetened condensed / evaporated; sweetened condensed would make it dessert-sweet).
- Two different numbers for the same rating.
- Steps in an order that will not work — e.g. everything goes in the pot before the beans are rehydrated.
- Missing seasoning, missing heat level, missing "until what" (until tender? until browned?).

Silent fixes: spelling (`tomatos` → `tomatoes`), obvious typos, table formatting. Anything else gets flagged in one short line, not a lecture.

## House constraints (for generated recipes only)

These apply when *we* invent a meal. A recipe the cook dictates is whatever the cook says it is — even dairy-heavy mac and cheese.

- Mostly dairy free: butter is fine, milk and cheese generally are not; substitutes acceptable.
- No avocados.
- Keep refined carbs and added sugar low.
- No seafood — our kid will not eat it; offer an alternative protein if a dish leans that way.
- Red meat occasionally, not daily; cook an alternative protein for Mom.
- Kid-friendly, but we want variety across proteins, cuisines, and cooking methods.

## After writing

Report: the file path, what you inferred or filled in, and anything still unset (ratings, an amount). Do not paste the whole file back. Offer to commit; the cook usually says "commit push".

## Examples

**"new recipe: Bacon Mac — bacon, flour, milk, gouda, sharp cheddar, parmesan, pasta, panko…"**
1. Check `recipes/` for an existing mac and cheese (Fake Fredo exists, but it is dairy-free-adjacent and a different dish → new file).
2. Write `recipes/bacon-mac.md` in the template, ratings `—`.
3. Flag the hole: directions remove the bacon but never return it. Add "crumble most into the sauce, reserve chunks for the top" and say so.
4. Ask for the four ratings.

**"add this recipe https://www.example.com/beef-chili"**
1. Fetch it, keep the source's ingredient list and steps.
2. Convert to house format; drop the source's exact measurements down to theme-level amounts unless the cook wants them kept.
3. Estimate the four ratings and label them as estimates in the reply.
4. Put the URL in Other Considerations.
