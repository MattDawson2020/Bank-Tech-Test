Bank-Tech-Test
=================
Challenge:
 -------
Build a Tech Test to given specifications with a focus on clean and readable code



<p>&nbsp;</p>

 Completed Features:
 -------
 - [x] Create an account with added transaction history
 - [x] Make deposits and withdrawals that record transactions in the transaction history
 - [x] Print out a statement in the desired format
<p>&nbsp;</p>

## How to install and run
<p>&nbsp;</p>

### Setup
```
git clone https://github.com/MattDawson2020/in_the_airbnb_tonight.git

bundle
```
### Run App
App is REPL based, use IRB (or PRY) and require the app.rb file, which in turn requires the class files for you
```

```
<p>&nbsp;</p>

## User Interface Flow

<details>
  <summary> Sign up </summary>
    <img src="/public/images/user_interface/sign_up.png">
    <br>
    Flash error if email used is not unique 
    <br>
    <img src="/public/images/user_interface/signup_error_flash.png">
    <br>
</details>

<details>
  <summary> Sign in </summary>
    <img src="/public/images/user_interface/sign_in.png">
    <br>
    <img src="/public/images/user_interface/incorrect_login_flash.png">
    <br>
</details>

<details>
  <summary> Listings homepage </summary>
    <img src="/public/images/user_interface/listings_homepage.png">
    <br>
</details>

<details>
  <summary> List a new property </summary>
    <img src="/public/images/user_interface/list_property.png">
    <br>
</details>

<details>
  <summary> View a property </summary>
    <img src="/public/images/user_interface/property_description_page.png">
    <br>
</details>

<details>
  <summary> Request to rent a property </summary>
    <img src="/public/images/user_interface/make_booking.png">
    <br>
    Booking status set to pending review <br>
    <img src="/public/images/user_interface/rental_request_sent.png">
    <br>
    Dates in past trigger error <br>
    <img src="/public/images/user_interface/date_in_past_flash.png">
    <br>
</details>

<details>
  <summary> Property request message received </summary>
    Property owner messages view <br>
    <img src="/public/images/user_interface/rental_request_message.png">
    <br>
</details>

<details>
  <summary> Property request approved </summary>
    Renter messages view <br>
    <img src="/public/images/user_interface/request_approved_message.png">
    <br>
</details>

<details>
  <summary> Booking status updated </summary>
    <img src="/public/images/user_interface/booking_status_updated.png">
    <br>
</details>

<details>
  <summary> Logout </summary>
    <img src="/public/images/user_interface/logout.png">
    <br>
</details>

<p>&nbsp;</p>

## Planning

### Specification
<details>
<summary> Headline </summary>
<br>
<ul>






<li>**Given** a client makes a deposit of 1000 on 10-01-2012  </li>
<li>**And** a deposit of 2000 on 13-01-2012  </li>
<li>**And** a withdrawal of 500 on 14-01-2012  </li>
<li>**When** she prints her bank statement   </li>
<li> **Then** she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
</li>
</ul>
</details>


<details>
<summary>Extras </summary>
<br>
<ul>
I kept it close to the specification, but made small additions where easy and appropriate:
<li>Users cannot deposit/ withdraw anything but numeric values</li>
<li>Users cannot withdraw more than they have as no overdraft was specified</li>
<li>Separated printing a statement to it's own class even though it is simpler as a feature on the account, to adhere to SRP</li>
</ul>
</details>
<p>&nbsp;</p>

### User Stories
```

As a User
So I can store my money
I would like to make a deposit

As a User
So I can use my money
I would like to make a withdrawal

As a User
So I can see my transaction history
I would like to print my statement


As a Developer
So I can pass my tech test
I would like the print to be formatted like the diagram

```
<p>&nbsp;</p>

### Domain Model

<details>
<summary>Original design </summary>
<br>
<img src="images/Screenshot 2021-06-01 at 11.32.07.png">
</details>

<details>
<summary>Updated design </summary>
<br>
<img src="images/diagram (1).svg">
</details>

<p>&nbsp;</p>
