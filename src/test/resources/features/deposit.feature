Feature: transfer
    As a customer
    I want to deposit money into my account

Scenario Outline: Deposit with no exsiting balance as table
    Given a customer with id 1 and pin 0000 exists
    When I login to ATM with id 1 and pin 0000
    When I deposit <amount> to my account
    Then my account balance is <value>

    Examples:
        | amount | value |
        | 0 | 0 |
        | 1000.00 | 1000.00 |
        | 1257.63 | 1257.63 |

Scenario Outline: Deposit with existing balance as table
    Given a customer with id 1 and pin 0000 with balance 1000.50 exists
    When I login to ATM with id 1 and pin 0000
    When I deposit <amount> to my account
    Then my account balance is <value>

    Examples:
        | amount | value |
        | 0 | 1000.50 |
        | 1000.00 | 2000.50 |
        | 1257.00 | 2257.50 |
