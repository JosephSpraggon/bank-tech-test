*Joe's Bank Tech Test*

 --------------------------------------------------

*Setup:*

This project runs on Ruby 2.7.0 

Firstly to run the tests as well as check the test coverage you'll need the following gems in your Gemfile:

'rspec'
'simplecov'
'rubocop'

As well as "source 'http://rubygems.org'" at the top!

Then  run 'bundle install' in the command-line.

Once all gems are bundled you can run 'rspec' in the command-line and you should see all green tests and 100% coverage 😄

You can also run the linter 'rubocop' by running 'rubocop' in the command-line and (hopefully) see only one offense! (There were loads before, believe me! so just one I think isn't so bad 😅 )

 --------------------------------------------------

*Running the project:*

In the command-line make sure you're within the bank-tech-test directory and run "irb -r './lib/account.rb'"

Then create a new account using 'Account.new' then you can begin to make deposits '.deposit(100)', withdrawals '.withdraw(50)' and then to see your bank statement printed to the console use '.print_statement'!

<img width="1427" alt="Screenshot 2021-03-10 at 14 47 54" src="https://user-images.githubusercontent.com/74933838/110654708-4b29e580-81b6-11eb-8be8-e4e705324326.png">

 --------------------------------------------------

*Client Specification:*

//Requirements:

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


//Acceptance criteria:

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see:

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

------------------------------------------------

*How I Achieved This:* 

//Original rough planning notes:

- one Account class, that will store all the data

- deposit method that takes two arguments, amount(credit) & date, will store these in the object as a key/value pair within a hash, as well as add amount to the balance

- withdraw method that takes two arguments, amount(debit) & date, will store these in the object as a key/value pair within a hash, as well as minus amount to the balance

- print method that displays, date, amount(credit or debit), total balance

//My approach:

Initially I started with the one 'Account' class, which was responsible for everything in the project. It stores all transactions with in a hash called '@transactions' that is initialized with every new account object.

I knew that I wanted to store transactions as key/value pairs, so a hash made sense and that the 'date' would be the key, and the 'amount' would be the value.

Transactions are carried out using the 'deposit' and 'withdraw' methods which are both fed an argument 'amount' which is the amount that users would like to deposit or withdraw respectively. As you can see in my original notes above, I originally thought I would have the users input the date as another argument for every transaction, however I thought human error could effect the accuracy of the 'statement' so I thought instead I would auto generate the date using the ruby 'Time' class. Also as using the 'Time.now' method I could use this to create unique keys for the '@transactions' hash.

the '.print_statement' method originally started as a long 'print' method attached to the end of the 'Account' class. Once I had learned about testing using standard output and I was confident that it could display the statement accurately, I began to refactor the 'print' method into multiple private ones. Each time I would extract out a new private method I would run 'rspec' to check that my tests all still ran green.

Once 'print' was looking a lot more readable I felt the 'Account' class was quite clearly handling two responsibilities, the transactions and the printing of the statement. It made sense to split the class in half. So I created the 'Statement' class.

Here I slowly moved over the statement related private methods, all the while,checking that all tests still passed. I then moved over the main bulk of the old 'print' method and in it's place created the '.print_statement' method that would create a new statement object, feed in the '@transactions' and then have it print the statement out to the console as well as return it to Ruby!

Having a suite of working tests made it so much easily to check that I was both refactoring and extracting correctly and with the desired results! Therefore I haven't written a 'statement_spec.rb' file, as all original tests checking the output for printing the statement were passing.

------------------------------------------------
