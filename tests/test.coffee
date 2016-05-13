selenium = require 'selenium-webdriver'
chai = require 'chai'
chai.use require 'chai-as-promised'
expect = chai.expect
chrome = require 'selenium-webdriver/chrome'


path = require('chromedriver').path
service = new chrome.ServiceBuilder(path).build()
chrome.setDefaultService(service);



before ->
  @timeout 20000
  @driver = new selenium.Builder()
    .withCapabilities(selenium.Capabilities.chrome())
    .build()
  @driver.getWindowHandle()

after ->
  @driver.quit()

describe 'Example Tests', ->
  beforeEach ->
    @driver.get 'http://localhost:3000/'

  it 'check element by Title', ->
    expect(@driver.getTitle()).to.eventually.contain
    'Backbone React Testing App'

   it 'check element by CSS selector', ->
    text = @driver.findElement(css: '.container div').getText()
    expect(text).to.eventually.equal 'Selenium Check'
