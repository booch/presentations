Testing Web Apps with Selenium, Capybara, and Cucumber
================
### by Craig Buchek
### St. Louis GNU/Linux Users Group
### 2012-06-21


Automated Testing
=================
* Regression Testing
* Acceptance Testing
  * Know when you're done writing code
* Smoke Testing
* TDD
  * BDD
  * ATDD
* Does not completely replace manual testing


Selenium (WebDriver)
========
* <http://seleniumhq.org/>
* Supported languages:
  * Java
  * C#
  * Ruby
  * Python
  * Perl (3rd party)
  * PHP (3rd party)
* Supported browsers:
  * Firefox 3.6+
  * Chrome 12+ (requires extra download)
  * IE 6+ (requires extra download for better support)
  * Safari 5+ (beta)
  * Opera 11.5+
  * Android 2.3+ (requires extra download and Android SDK)
  * iOS 3.2+ (requires extra download, XCode, iOS SDK, and developer license)
* Selenium IDE
* Selenium Server (remote control)
* Selenium RC (old remote control)
* Selenium Grid (distribute over multiple machines or VMs)
* Commercial support/users
  * Sauce Labs
  * Gomez RealityCheck
  * BrowserMob (load testing)

* Java Example: Selenium2Example at <http://seleniumhq.org/docs/03_webdriver.html>

* Ruby Example: Ruby code at <http://seleniumhq.org/docs/03_webdriver.html>

* Live Example: IRB
        #gem install selenium-webdriver
        require 'selenium-webdriver'
        driver = Selenium::WebDriver.for :firefox
        driver.get 'http://google.com'
        inputElement = driver.find_element :name => "q"
        inputElement.send_keys "Cheese!"
        #inputElement.send_keys :enter
        #inputElement.submit
        buttonElement = driver.find_element :name => "btnG"
        buttonElement.click
        # TODO: Observe results.
        driver.quit


Capybara
========
* <http://jnicklas.github.com/capybara/>
* Simple front end to Selenium
  * Can also front end directly to Webkit or Rack (Rails)
* My cheatsheet: <https://github.com/boochtek/cheatsheets/blob/master/capybara.md>

* Live Example: IRB
        #gem install capybara
        require 'capybara/dsl'
        Capybara.default_driver = :selenium
        include Capybara::DSL
        visit('google.com')
        fill_in 'q', with: 'Craig Buchek'
        click_button 'gbqfb' # Or click_on 'gbqfb'
        # TODO: Observe results.
        quit


Cucumber
========
* <http://cukes.info>
* Describe behavior in plain text.
  * Supports many different human languages.
  * Given, When, Then, And, But (case sensitive)
* Scenario
* Scenario Outlines / Examples
* Feature Introduction
        As a <role>,
        I want to <perform some action>
        In order to <achieve some goal>
* Goal should be one of:
  * Increase Revenue | Reduce Costs | Protect Revenue
  * You might have to pop the "why" stack 5 times to get to the true business value
* Step definitions convert English to Ruby (or Java)
  * Cucumber compares English strings to Ruby regular expressions
* Cucumber-JVM
* Tags
* Background
* Higher-level steps
  * Descriptive versus imperative

* Example:
        Given I am on the Google search page
        When I search for "Craig Buchek"
        Then I should see "craigbuchek.com" in the search results


Advanced Ideas
==============
* Headless drivers
  * Rack
  * HtmlUnit
  * Mechanize
  * Capybara-Webkit
  * Poltergeist (PhantomJS)
* Parallel test runs
* WaterBuffalo (Java port of Capybara)
* Testing command-line programs (Aruba)
* Relish
* JBehave


Credits
=======
* Books
  * RSpec Book
  * Cucumber Book


Advanced Selenium
=================
        wait_for_element(locator)
        is_element_present(locator)
        is_something_selected(locator)
        get_table(locator, row, column)
        get_selected_label(locator)
        assign_id(locator, id)
        set_speed(milliseconds)
        highlight(locator)
        get_xpath_count(xpath)
        Bermuda - Capybara step library for jQuery UI widgets
        crb - irb + Cucumber
