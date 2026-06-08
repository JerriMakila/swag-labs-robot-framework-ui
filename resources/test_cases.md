# Test Cases For Swag Lab UI

## Login

| Test Case Id | Test Case |
|---|---|
| 01 | Log in page should have Swag Labs header |
| 02 | Log in page should have Login module |
| 03 | Login module should have text fields for username and password |
| 04 | Login module should have 'Login' button |
| 05 | Log in page should have credentials module |
| 06 | Logging in with a standard user using correct username and password should succeed |
| 07 | Logging in with a standard user using non-existing username should show error message in error message container |
| 08 | Logging in with a standard user using correct username and incorrect password should show error message in error message container |
| 09 | Logging in without entering username should show error message in error message container |
| 10 | Logging in without entering password should show error message in error message container |
| 11 | Logging in without entering either username or password should show error message in error message container |
| 12 | Logging in with a locked out user using correct username and password should not succeed |

## Products

| Test Case Id | Test Case |
|---|---|
| 13 | Product page should have site header |
| 14 | Site header should have hamburger menu button |
| 15 | Site header should have site header text |
| 16 | Site header should have shopping cart link |
| 17 | Product page should have page header |
| 18 | Product page should have site footer |
| 19 | Product page should have inventory container |
| 20 | Inventory container should contain inventory item(s) |
| 21 | Inventory items should have inventory item image |
| 22 | Inventory items should have inventory item name |
| 23 | Inventory items should have inventory item description |
| 24 | Inventory items should have inventory item price |
| 25 | Inventory items should have inventory 'Add to cart' button |
| 26 | Sorting inventory items from A to Z should show the items in ascending alphabetical order by product name |
| 27 | Sorting inventory items from Z to A should show the items in descending alphabetical order by product name |