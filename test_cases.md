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
| 16 | Product page should have inventory container |
| 17 | Inventory container should contain inventory item(s) |
| 18 | Inventory items should have inventory item image |
| 19 | Inventory items should have inventory item name |
| 20 | Inventory items should have inventory item description |
| 21 | Inventory items should have inventory item price |
| 22 | Inventory items should have inventory 'Add to cart' button |
| 23 | Pressing 'Add to cart' button in an inventory item should make the button text change to 'Remove' |
| 24 | Pressing 'Remove' button in an inventory item should remove the item from cart |
| 25 | Adding an item to an empty cart should make a red icon with number 1 appear on shopping cart link |
| 26 | Adding an item to a non-empty cart should increment the number on shopping cart link by one |
| 27 | Sorting inventory items by 'Names' from A to Z should be selected by default when opening the product page |
| 28 | Sorting inventory items by 'Names' from A to Z should show the items in ascending alphabetical order by product name |
| 29 | Sorting inventory items by 'Names' from Z to A should show the items in descending alphabetical order by product name |
| 30 | Sorting inventory items by 'Price' from low to high should show the items in ascending order by price |
| 31 | Sorting inventory items by 'Price' from high to low should show the items in descending order by price |

## Cart Page

| Test Case Id | Test Case |
|---|---|
| 32 | Cart page should have page header with 'Your Cart' text |
| 33 | Cart page should have cart list |
| 34 | If cart is empty, cart list should only have headers for 'QTY' and 'Description' |
| 35 | If cart has items, cart list should contain a list item for every added product |
| 36 | Product info in cart items should be identical to the product info in Products page |
| 37 | Cart items should show the quantity of the same products added to the cart |
| 38 | Cart items should have 'Remove' button|
| 39 | Pressing 'Remove' button in a cart item should remove the cart item from the cart |
| 40 | If cart has more than one item, removing one item should not remove other items |
| 41 | Cart page should have cart footer |
| 42 | Cart footer module should have buttons 'Continue Shopping' and 'Checkout' |
| 43 | Pressing 'Continue Shopping' button in cart footer should open Products page |
| 44 | After pressing 'Continue Shopping' when cart has items, cart icon in the site header should show correct amount of items in the cart |
| 45 | Cart list should be retained after logging out and back in again |
| 46 | Pressing 'Checkout' button in cart footer should open Checkout: Your Information page if cart has items |
| 47 | Pressing 'Checkout' button in cart footer should not open Checkout: Your Information page if cart is empty |

## Checkout - Your Information

| Test Case Id | Test Case |
|---|---|
| 48 | Your Information page should have page header with 'Checkout: Your Information' text |
| 49 | Your Information page should have information form with text fields 'First Name', 'Last Name' and 'Zip/Postal Code' |
| 50 | Information form should have buttons 'Cancel' and 'Continue' |
| 51 | Pressing 'Cancel' button in information form should open cart page |
| 52 | Pressing 'Continue' button in information form should open Checkout - Overview page if every text field in information form is filled |
| 53 | Pressing 'Continue' in information form when First Name field is empty should show error icon and error message |
| 54 | Pressing 'Continue' in information form when Last Name field is empty should show error icon and error message |
| 55 | Pressing 'Continue' in information form when Zip/Postal Code field is empty should show error icon and error message |
| 56 | Pressing 'Continue' in information form all text fields are empty should show error icon and error message |
| 57 | Pressing 'X' in error message container closes the container and removes the error icons |

## Checkout - Overview

| Test Case Id | Test Case |
|---|---|
| 58 | Overview page should have page header with 'Checkout: Overview' text |
| 59 | Overview page should have list of items in the cart |
| 60 | Item list should have headers 'QTY' and 'Description' |
| 61 | Product info in list items should be identical to the product info in Products page |
| 62 | List items should show the quantity of the same products added to the cart |
| 63 | Overview Page should have overview summary info with fields 'Payment Information', 'Shipping Information' and 'Price Total' |
| 64 | 'Price Total' in overview page should show total item price |
| 65 | 'Price Total' in overview page should show tax amount |
| 66 | 'Price Total' in overview page should show total price that is a sum of item total price and tax |
| 67 | Overview page should have buttons 'Cancel' and 'Finish' |
| 68 | Pressing 'Cancel' button in Overview page should open Products page |
| 69 | Pressing 'Finish' button in Overview page should open Checkout - Complete page |
| 70 | Pressing 'Finish' button should empty cart and cart icon should not have a number icon on it |

## Checkout - Complete

| Test Case Id | Test Case |
|---|---|
| 71 | Complete page should have page header with 'Checkout: Complete!' text |
| 72 | Complete page should have pony express icon |
| 73 | Complete page should have a 'Thank you' text and text about order having been dispatched |
| 74 | Complete page should have 'Back Home' button |
| 75 | Pressing 'Back Home' button should open Products page |

## Site Header

| Test Case Id | Test Case |
|---|---|
| 76 | Product page should have site header |
| 77 | Cart page should have site header |
| 78 | Your Information page should have site header |
| 79 | Overview page should have site header |
| 80 | Complete page should have site header |
| 81 | Site header should have hamburger menu button |
| 82 | Site header should have site header text |
| 83 | Site header should have shopping cart link |
| 84 | Clicking cart link should open cart page |
| 85 | Clicking hamburger icon should open hamburger menu on the left side of the page |
| 86 | Clicking 'X' in the top right of the hamburger menu on the left side of the page should close the hamburger menu |
| 87 | Hamburger menu should have the correct items |
| 88 | Clicking 'All Items' in the hamburger menu should open product page |
| 89 | Clicking 'About' in the hamburger menu should open About page for Sauce Labs |
| 90 | Clicking 'Logout' in the hamburger menu should log out the current user and open login page |

## Site Footer

| Test Case Id | Test Case |
|---|---|
| 91 | Product page should have site footer |
| 92 | Cart page should have site footer |
| 93 | Your Information page should have site footer |
| 94 | Overview page should have site footer |
| 95 | Complete page should have site footer |
| 96 | Site footer should have social media links |
| 97 | Site footer social media links should lead to their respective social media profile |
| 98 | Site footer should have footer text |