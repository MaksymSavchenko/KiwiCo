require "appium_lib"
require "pry"
require 'ImageResize'

opts= {
        caps: {
              platformName: 'Android',
              deviceName: 'SomeDevice',
              platformVersion: '6.0',
       			  browserName:   'Chrome',
              newCommandTimeout: '3600'
        },
#				appium_lib:{
#							server_url: 'http://0.0.0.0:4723/wd/hub'
#				}
}

#Appium::Driver.new(caps)
Appium::Driver.new(opts)
##Appium::Driver.new(opts, true)
#@selenium_driver = @appium_driver.start_driver
Appium.promote_appium_methods Object

#@driver = Appium::Driver.new(opts)
#@driver.start_driver.manage.timeouts.implicit_wait = 10
