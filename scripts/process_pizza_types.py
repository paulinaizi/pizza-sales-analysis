import pandas as pd
from pathlib import Path

project_root = Path(__file__).resolve().parent.parent
data_path = project_root/'pizza-place-sales-data'

# original file:
org_file = data_path/'pizza_types.csv'

# output files:
pizza_types_f = data_path/'pizza_types_cleaned.csv'
ingredients_f = data_path/'ingredients.csv'
categories_f = data_path/'categories.csv'
pizza_ingredients_f = data_path/'pizza_ingredients.csv'

df = pd.read_csv(org_file, encoding="cp1252")

categories_list = sorted(df['category'].unique())
category_id_map = {name: index + 1 for index, name in enumerate(categories_list)}

ingredients_set = set()
pizza_ingredients = []

for _, row in df.iterrows():
    ingredients = [i.strip() for i in row['ingredients'].split(',')]
    for ing in ingredients:
        ingredients_set.add(ing)
        pizza_ingredients.append((row['pizza_type_id'], ing))

ingredients_list = sorted(ingredients_set)
ingredient_id_map = {name: index + 1 for index, name in enumerate(ingredients_list)}

df_edited = df.copy()
df_edited['category_id'] = df_edited['category'].map(category_id_map)
df_edited = df_edited.drop('category', axis=1)
df_edited = df_edited.drop('ingredients', axis=1)
df_edited.to_csv(pizza_types_f, index=False, encoding="utf-8")

categories_df = pd.DataFrame({
    'category_id': list(category_id_map.values()),
    'name': list(category_id_map.keys())
})
categories_df.to_csv(categories_f, index=False, encoding='utf-8')

ingredients_df = pd.DataFrame({
    'ingredient_id': list(ingredient_id_map.values()),
    'name': list(ingredient_id_map.keys())
})
ingredients_df.to_csv(ingredients_f, index=False, encoding='utf-8')

pizza_ingredients_df = pd.DataFrame([
    {'pizza_type_id': pizza, 'ingredient_id': ingredient_id_map[ing]}
    for pizza, ing in pizza_ingredients
])
pizza_ingredients_df.to_csv(pizza_ingredients_f, index=False, encoding='utf-8')
