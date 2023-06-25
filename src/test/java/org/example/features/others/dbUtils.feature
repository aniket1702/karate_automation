Feature: Creating a Database Connection

  Background:
    * def DBUtils = Java.type('org.example.utils.DBUtils')
    * def db = new DBUtils()
    * def product = read('../inputs/products.json')
    * def GenerateRandomDigitUtils = Java.type('org.example.utils.GenerateRandomDigitUtils')
    * def gtin = new GenerateRandomDigitUtils()


  @smoke @regression
  Scenario: Read a single value from the database
    * def value = db.readValue('SELECT count(*) FROM users')
    * print value
    Then match value == 3

  @debug
  Scenario: get all users
    * def users = db.readRows('SELECT * FROM users')
    * print users

  @smoke @debug
  Scenario: get Single users
    * def user = db.readRow('SELECT * FROM users WHERE user_id=15')
    * print user
    * def expectedOutput = read('../outputs/ExpectedOutput.json')
    Then match user == expectedOutput


  @sanity
  Scenario: get GTIN
    * def gtinNumber = gtin.generateRandomGtinNumber()
    Then print gtinNumber

    @ignore
  Scenario: Insert product data into the database
    * def insertProducts = db.insertProduct(product.product_title,product.product_name,product.product_desc,product.is_available,product.product_price,product.product_quantity,product.category_id)
    When def insertedProduct = db.readRow("SELECT * FROM products WHERE product_id=" + product.product_id)

#  Scenario Outline: insert a new user into the database
#    * def result = db.insertUser('<username>', '<email>', '<password>')
#
#    Examples:
#      | username | email                | password   |
#      | john     | john.doe@example.com | password1  |
#      | jane     | jane.doe@example.com | password2  |