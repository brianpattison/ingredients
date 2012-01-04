# Ingredients

Calculate the cost of recipes based on the cost of ingredients.

## How to Deploy

I suggest using Heroku. They have great docs. It's as simple as cloning this repository, pushing to Heroku.

## Authentication

To set up the first user, log into the Rails console and enter:

`User.setup`

## How to Calculate the Cost of Recipes

### 1. Create ingredients with the along with the cost of the purchase.

Enter the ingredient's name, amount purchased (Ex. 1 gallon), and cost.

### 2. Create a recipe that uses the ingredients.

Recipes have a name, a yield, and a list of ingredients used. Each ingredient has an amount (Ex. 1 cup), and compatibility is checked first with the purchased amount to make sure the units can be converted for the calculation.

### 3. Done.

Enjoy!