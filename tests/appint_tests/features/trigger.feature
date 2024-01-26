Feature: List of Airports
  As an API consumer
  I want to get info about airports
  So that I can make better informed travel decisions.

  Scenario: I should be able to list all airports
    Given I set Content-Type header to application/json
    Given I set Authorization header to Bearer MY-TOKEN
    Given I set body to {"trigger_id":TRIGGER_NAME,"input_parameters":{"InputJson":{"json_value":"{\"operation\":\"LIST\",\"filterQuery\":\"\"}"}} }
    When I POST to /
    Then response code should be 200
    And response body path $.outputParameters.* should be of type array 

Scenario: I should be able to get one airports from code
    Given I set Content-Type header to application/json
    Given I set Authorization header to Bearer MY-TOKEN
    Given I set body to {"trigger_id":TRIGGER_NAME,"input_parameters":{"InputJson":{"json_value":"{\"operation\":\"LIST\",\"filterQuery\":\"code=\'AAC\'\"}"}}}
    When I POST to /
    Then response code should be 200
    And response body path $.outputParameters[*][0].airport should be Al Arish, Egypt 

Scenario: I should receive a null value for non-existing codes
    Given I set Content-Type header to application/json
    Given I set Authorization header to Bearer MY-TOKEN
    Given I set body to {"trigger_id":TRIGGER_NAME,"input_parameters":{"InputJson":{"json_value":"{\"operation\":\"LIST\",\"filterQuery\":\"code=\'XTOF\'\"}"}}}
    When I POST to /
    Then response code should be 200
    And response body path $.outputParameters[*][0].airport should be null


