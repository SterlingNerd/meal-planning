---
name: meal-planner
description: Call this skill whenever the user wants to plan meals, create a menu, browse recipes, or generate a grocery list.
---

# Meal Planning Instructions
When the user asks for a meal plan or shopping list, follow these procedural steps:
- **Do NOT write code**
- **Do NOT make up recipes or ingredients**
- use the instructions below to process markdown recipes in /recipes.

1. **Scan Recipes**: Read the `/recipes/` directory to identify candidates.
   - Each recipe is a markdown file with an "Ingredients Table" that lists the ingredients needed for that recipe.
   - Do not make up recipes; only include recipes that are already available in the `/recipes/` directory.
2. **Filter by Constraints**:
   - How many meals does the user want to plan for?
   - Did the user specify any thematic or ingredient preferences? (e.g., "Italian week", "use chicken", "avoid pasta")
   - Unless otherwise directed, assume we're planning for dinner meals.
3. **Balance the Week**:
   - Prefer **Ease >= 4** for weeknights.
   - Use ratings to balance family favorites with new experiments.
4. **Propose Menu**:
   - Provide Menu.
   - Allow user to review and request changes (e.g., swap meals, adjust for schedule, etc.)
5. **Generate Shopping List**:
   - When the user is satisfied with the menu, use the `shopping-list-builder` skill to generate a consolidated Shopping List based on the "Ingredients Table" in each selected recipe.