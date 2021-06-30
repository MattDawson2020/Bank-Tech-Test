Bank-Tech-Test
=================
Challenge:
 -------
Build a Tech Test to given specifications with a focus on clean and readable code

### Specification

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


## Feedback and changes

<details>
  <summary> What the coach liked </summary>
  
  * The error handling on bad inputs 
  
  * A central loader class `app.rb` that saves me all the `irb` set up 
  
  * Statement class is clean and well implemented 
  
  * Tests are well written and use doubles very well 
  
  * The code in general is very high quality 
</details>

<details>
  <summary> Improvements to be made </summary>
  
  * No need for balance attribute on accounts as this can be calculated using the balance on transactions, avoiding duplication
 
  * Too much abstraction in having a seperate transaction history class, initially put in for SRP purposes, but is actually somewhat redundant and over-engineered
  
  * There are three tests for different types of print statements, but this is uneccesary for requirements and these can be combined into one
  
  * A few tests are redundant
</details>


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

### Design

<details>
<summary>Original design with print statement defined on account class</summary>
<br>
<img src="images/Screenshot 2021-06-01 at 11.32.07.png">
</details>

<details>
<summary>Updated design with separated responsibilities</summary>
<br>
<img src="images/diagram (1).svg">
</details>

<p>&nbsp;</p>
<details>
<summary>Extras </summary>
<br>
<ul>
<li>I kept it close to the specification, but made small additions where easy and appropriate</li>
<li>Users cannot deposit/ withdraw anything but numeric values</li>
<li>Users cannot withdraw more than they have as no overdraft was specified</li>
<li>Separated printing a statement to it's own class even though it is simpler as a feature on the account, to adhere to SRP</li>
</ul>
</details>
<p>&nbsp;</p>


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
git clone https://github.com/MattDawson2020/gilded-rose-ruby-tech-test

bundle
```
### Run App
App is REPL based, use IRB (or PRY) and require the app.rb file, which in turn requires the class files for you
- Create an account object { **account = Account.new** }in the terminal, which defaults to a balance of 0
- Use **account.deposit(amount)** or **account.withdraw(amount)** with amount being an integer or float numeric value
- You can use **account.transaction_history** to see an array of transactions
- To select an individual transaction use **account.transaction_history.transactions** and a selector { i.e .first }
- To create a statement object { **statement = Statement.new(account)** } with an injected account object
- To print a statement use **statement.print_statement**, it will draw data through the injected account and format it for you
<p>&nbsp;</p>


<p>&nbsp;</p>

