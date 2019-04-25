# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project -- Used RoR
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- User has many data packages, data packages has many documents 
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- Data package belongs to user, document belongs to data package
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -- User has many documents through datapackages, documents has many users through data packages 
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- Many to many: favorites/ users/ data packages 
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -- User validates presence and uniqueness of email, DataPackage and Document validates name, Favorite validates notes
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- Favorites has a notes attribute
- [X] Include signup (how e.g. Devise) -- built
- [X] Include login (how e.g. Devise) -- built
- [X] Include logout (how e.g. Devise) -- built
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -- Document's new is nested in DataPackage
- [X] Include nested resource show or index (URL e.g. users/2/recipes) -- Document's show is nested in DataPackage
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) Facebook with oauth
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
