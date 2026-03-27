---
name: meal-planner
description: Call this skill whenever the user wants to plan meals, create a menu, browse recipes, or generate a grocery list.
---

# Meal Planning Instructions
When the user asks for a meal plan or shopping list, follow these procedural steps:
**Do NOT write code**; use the instructions below to process markdown recipes in /recipes.

1. **Clarify Request**: Ensure you understand the user's request (e.g., number of meals, etc.)
2. **Scan Recipes**: Read the `recipes/` directory to identify candidates.
3. **Filter by Constraints**:
   - Did the user specify any thematic or ingredient preferences? (e.g., "Italian week", "use chicken", "avoid pasta")
4. **Balance the Week**:
   Unless otherwise directed, assume we're planning for dinner meals. Use ratings to balance family favorites with new experiments
   - Select recipes with **Ease >= 4** for weeknights.
   - Use ratings to balance family favorites with new experiments
5. **Propose Menu**:
   - Provide Menu.
   - Allow user to review and request changes (e.g., swap meals, adjust for schedule, etc.)
6. **Generate Shopping List**:
   - Generate a consolidated Shopping List based on the "Ingredients Table" in each selected recipe.
   - Save the shopping list to `shopping-list.md` for user review.
7. **Todoist Integration**:
   - After user reviews the shopping list, send the final list to Todoist.
