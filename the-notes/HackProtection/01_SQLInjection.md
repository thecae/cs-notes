# SQL Injection (SQLi)
*SQL injection* is a type of injection attack. Injection attacks occur when maliciously crafted inputs are submitted by an attacker, causing an application to perform an unintended action. Because of the ubiquity of SQL databases, SQL injection is one of the most common types of attack on the internet.

## Risks
In the past, hackers have used injection attacks to:

- Extract sensitive information, like Social Security numbers, or credit card details.
- Enumerate the authentication details of users registered on a website, so these logins can be used in attacks on other sites.
- Delete data or drop tables, corrupting the database, and making the website unusable.
- Inject further malicious code to be executed when users visit the site.

SQL injection attacks are astonishingly common. Major companies like Yahoo and Sony have had their applications compromised. In other cases, hacker groups targeted specific applications or wrote scripts intended to harvest authentication details. Not even security firms are immune!

## Protection
Programming languages talk to SQL databases using *database drivers*. A driver allows an application to construct and run SQL statements against a database, extracting and manipulating data as needed. *Parameterized statements* make sure that the parameters (i.e. inputs) passed into SQL statements are treated in a safe manner.

Below is the explicit construction of the SQL string, which is **very dangerous**:
```java
// user email we want to find
String email = "user@email.com";

// Connect to the database
Connection conn = DriverManager.getConnection(URL, USER, PASS);
Statement stmt = conn.createStatement();

// Bad, bad news! Don't construct the query with string concatenation.
String sql = "SELECT * FROM users WHERE email = '" + email + "'";

// I have a bad feeling about this...
ResultSet results = stmt.executeQuery(sql);

while (results.next()) {
  // ...oh look, we got hacked.
}

```

Rather, we use a secure connection in Java via a parameterized statement.
```java
// Connect to the database.
Connection conn = DriverManager.getConnection(URL, USER, PASS);

// Construct the SQL statement we want to run, specifying the parameter.
String sql = "SELECT * FROM users WHERE email = ?";

// Generate a prepared statement with the placeholder parameter.
PreparedStatement stmt = conn.prepareStatement(sql);

// Bind email value into the statement at parameter index 1.
stmt.setString(1, email);

// Run the query...
ResultSet results = stmt.executeQuery(sql);

while (results.next())
{
    // ...do something with the data returned.
}
```

The key difference is the data being passed to the `executeQuery(...)` method. In the first case, the parameterized string and the parameters are passed to the database separately, which allows the driver to correctly interpret them. In the second case, the full SQL statement is constructed before the driver is invoked, meaning we are vulnerable to maliciously crafted parameters.

*You should always use parameterized statements where available, they are your number one protection against SQL injection.*

## Object-Relational Mapping
Many development teams prefer to use *Object Relational Mapping (ORM)* frameworks to make the translation of SQL result sets into code objects more seamless. ORM tools often mean developers will rarely have to write SQL statements in their code – and these tools thankfully use parameterized statements under the hood.

The following code is subject to SQL injection attacks:
```ruby
def current_user(email)
  # This code would be vulnerable to a maliciously crafted email parameter.
  User.where("email = '" + email + "'")
end
```
Concatenating strings are very prone to SQL injection and should not be used.  Rather, this ORM method will fix this issue.  The most well-known ORM is probably Ruby on Rails’ Active Record framework. Fetching data from the database using Active Record looks like this:
```ruby
def current_user(email)
  # The 'User' object is an Active Record object, that has find methods 
  # auto-magically generated by Rails.
  User.find_by_email(email)
end
```

## Escaping Inputs
If you are unable to use parameterized statements or a library that writes SQL for you, the next best approach is to ensure proper escaping of special string characters in input parameters.

Injection attacks often rely on the attacker being able to craft an input that will prematurely close the argument string in which they appear in the SQL statement. (This is why you you will often see ' or " characters in attempted SQL injection attacks.)

Programming languages have standard ways to describe strings containing quotes within them – SQL is no different in this respect. Typically, doubling up the quote character – replacing ' with '' – means “*treat this quote as part of the string, not the end of the string*”.

Exploiting quotes is not always how SQL injection is done.  The following code is still vulnerable:
```ruby
def current_user(id)
  User.where("id = " + id)
end
```

## Santizing Inputs
Sanitizing inputs is a good practice for all applications. The user may supply a password as `'` or `1=1--` as a classic injection technique, which looks pretty suspicious as a password choice.

Developers should always make an effort to reject inputs that look suspicious out of hand, while taking care not to accidentally punish legitimate users. For instance, your application may clean parameters supplied in GET and POST requests in the following ways:

- Check that supplied fields like email addresses match a regular expression.
- Ensure that numeric or alphanumeric fields do not contain symbol characters.
- Reject (or strip) out whitespace and new line characters where they are not appropriate.

## Sample Code
The code samples below illustrate good and bad practices when trying to protect against SQL injection.

#### Python
Insecure:
```python
# String concatenation is vulnerable.
cursor.execute("select user_id, user_name from users where email = '%s'" % email)

for row in cursor.fetchall():
  print row.user_id, row.user_name
```
Secure:
```python
# SQL and parameter is sent off separately to the database driver.
cursor.execute("select user_id, user_name from users where email = ?", email)

for row in cursor.fetchall():
  print row.user_id, row.user_name
```

## Principle of Least Privilege
Applications should ensure that each process or software component can access and affect only the resources it needs. Apply “levels of clearance” as appropriate, in the same way that only certain bank employees have access to the vault. Applying restricted privileges can help mitigate a lot of the risk around injection attacks.

It is rarely necessary for applications to change the structure of the database at run-time – typically tables are created, dropped, and modified during release windows, with temporarily elevated permissions. Therefore, it is good practice to reduce the permissions of the application at runtime, so it can at most edit data, but not change table structures. In a SQL database, this means making sure your production accounts can only execute DML statements, not DDL statements.

With complex database designs, it can be worth making these permissions even more fine-grained. Many processes can be permissioned to perform data edits only through stored procedures, or to execute with read-only permissions.

Sensibly designing access management in this way can provide a vital second line of defense. No matter how the attacker gets access to your system, it can mitigate the type of damage they can possibly do.

## Password Hashing
Our example hack relied on the fact that the password was stored as plain-text in the database. In fact, storing unencrypted passwords is a major security flaw in itself. Applications should store user passwords as strong, one-way hashes, preferably salted. This mitigates the risk of malicious users stealing credentials, or impersonating other users.

## Third Party Authentication
It is often worth considering out-sourcing the authentication workflow of your application entirely. Facebook, Twitter, and Google all provide mature OAuth APIs, which can be used to let users log into your website using their existing accounts on those systems. This saves you as an application developer from rolling your own authentication, and assures your users that their passwords are only stored in a single location.