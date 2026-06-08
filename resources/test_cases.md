# Test Cases For Swag Lab UI

## Login

| Test Case Id | Test Case |
|---|---|
| 01 | Log in page should have Swag Labs header |
| 02 | Log in page should have Login module |
| 03 | Login module should have text fields for username and password |
| 04 | Login module should have 'Login' button |
| 05 | Logging in with a standard user using correct username and password should succeed |
| 06 | Logging in with a standard user using non-existing username should show error message in error message container |
| 07 | Logging in with a standard user using correct username and incorrect password should show error message in error message container |
| 08 | Logging in without entering username should show error message in error message container |
| 09 | Logging in without entering password should show error message in error message container |
| 10 | Logging in without entering either username or password should show error message in error message container |
| 11 | Logging in with a locked out user using correct username and password should not succeed |

## Products

| Test Case Id | Test Case |
|---|---|
| 12 | Product page should have page header |
| 13 | Page header should have page header text |
| 14 | Page header should have dropdown menu for sorting options |
| 15 | Dropdown menu for sorting options should have correct items |
| 16 | Product page should have site footer |
| 17 | Site footer should have social media links |
| 18 | Site footer should have footer text |
| 19 | Product page should have inventory container |
| 20 | Inventory container should contain inventory item(s) |
| 21 | Inventory items should have inventory item image |
| 22 | Inventory items should have inventory item name |
| 23 | Inventory items should have inventory item description |
| 24 | Inventory items should have inventory item price |
| 25 | Inventory items should have inventory 'Add to cart' button |
| 26 | Pressing 'Add to cart' button in an inventory item should make the button text change to 'Remove' |
| 27 | Adding an item to an empty cart should make a red icon with number 1 appear on shopping cart link |
| 28 | Adding an item to a non-empty cart should increment the number on shopping cart link by one |
| 29 | Sorting inventory items by 'Names' from A to Z should be selected by default when opening the product page |
| 29 | Sorting inventory items by 'Names' from A to Z should show the items in ascending alphabetical order by product name |
| 30 | Sorting inventory items by 'Names' from Z to A should show the items in descending alphabetical order by product name |
| 31 | Sorting inventory items by 'Price' from low to high should show the items in ascending order by price |
| 32 | Sorting inventory items by 'Price' from high to low should show the items in descending order by price |

## Site Header

| Test Case Id | Test Case |
|---|---|
| 33 | Product page should have site header |
| 34 | Cart page should have site header |
| 35 | Checkout page should have site header |
| 36 | Site header should have hamburger menu button |
| 37 | Site header should have site header text |
| 38 | Site header should have shopping cart link |
| 38 | Clicking cart link should open cart page |
| 39 | Clicking hamburger icon should open hamburger menu on the left side of the page |
| 40 | Clicking 'X' in the top right of the hamburger menu on the left side of the page should close the hamburger menu |
| 41 | Hamburger menu should have the correct items |
| 42 | Clicking 'All Items' in the hamburger menu should open product page |
| 43 | Clicking 'About' in the hamburger menu should open About page for Sauce Labs |
| 44 | Clicking 'Logout' in the hamburger menu should log out the current user and open login page |

## Site Footer

| Test Case Id | Test Case |
|---|---|
| 45 | Product page should have site footer |
| 46 | Cart page should have site footer |
| 47 | Checkout page should have site footer |
| 48 | Site footer should have social media links |
| 48 | Site footer social media links should lead to their respective social media profile |
| 49 | Site footer should have footer text |