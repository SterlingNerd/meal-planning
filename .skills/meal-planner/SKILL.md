---
name: meal-planner
description: Use this skill to generate weekly meal plans, shopping lists, or recipe suggestions for the Sterling family. It enforces dietary restrictions (dairy-free, no seafood, no avocado).
---

# Meal Planning Instructions
When the user asks for a meal plan or shopping list, follow these procedural steps:

1. **Scan Recipes**: Read the `recipes/` directory to identify candidates.
2. **Filter by Family Constraints**:
   - **Strict No**: No Avocados, No Seafood (for child), No Milk/Cheese (Butter is okay).
   - **Preference**: Minimize Red Meat for Mom; prioritize 10yr-old friendly meals.
3. **Balance the Week**:
   - Select 3 recipes with **Ease >= 4** for weeknights.
   - Ensure at least 2 meals are **Mostly Plant-Based** or poultry for Mom.
   - Use ratings to balance family favorites with new experiments
4. **Output Format**:
   - Provide the Weekly Menu.
   - Generate a consolidated Shopping List based on the "Ingredients Table" in each selected recipe.
   - save the shopping list to `shopping-list.md` for user review.
5. **Todoist Integration**:
   - After user reviews the shopping list, send the final list to Todoist.
