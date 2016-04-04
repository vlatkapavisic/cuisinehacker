Feature: Recipes
In order to share the recipes I like
I want to be able to create them
And see them on my shiny blog

  @javascript
  Scenario: Visit a recipe page
    When I visit '/recipes/kale-lentil-beet-salad'
    Then I should see the page title 'Kale, lentil & beet salad'
      And I should see an image of the meal
      And I should see text 'If you're unsure whether to make this salad, google the health benefits of lentils, kale and beets.'

  Scenario: Visit a category page
    When I visit '/categories/lunch-dinner'
    Then I should see a list of recipes