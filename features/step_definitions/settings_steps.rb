Given(/^I land on Settings screen$/) do
  #find by recource-id
  find_element(id: "action_bar")
  #find by text
  text("Connections")

  #find by content-desc
  #find_element(accessibility_id: "Add to favorites")
  #find by nested elements:
  #find_element(id: "layout_unit_spinners").find_element(xpath: "//android.widget.TextView[@text='Foot']")
end

Then(/^build number should be "([^"]*)"$/) do |value|
  device_build = %x[adb shell getprop ro.build.id | tr -d '\n']
  if device_build != "R16NW"
    puts "Alert!!! Device has incorrect build number. Should be #{value}. Check system Update"
  end
end

Then(/^clean keyboard data$/) do
  %x[adb shell pm clear com.sec.android.inputmethod]
end

Then(/^click NEXT$/) do
  sleep 1
  Appium::TouchAction.new.swipe(start_x: 900, start_y: 2000, end_x: 900, end_y: 2000).perform
  sleep 0.5
end

Then(/^click START$/) do
  sleep 0.5
  Appium::TouchAction.new.swipe(start_x: 900, start_y: 2000, end_x: 900, end_y: 2000).perform
  sleep 0.5
end

Then(/^disable autosync$/) do
  find_element(class_name: "android.widget.Switch").click
  if_text_present_click("Turn off auto sync")
  if_text_not_present("Turn off auto sync")
end

Then(/^click Do not auto\-update languages$/) do
  sleep 0.5
  Appium::TouchAction.new.swipe(start_x: 200, start_y: 500, end_x: 200, end_y: 500).perform
end

Then(/^scroll down$/) do
  Appium::TouchAction.new.swipe(start_x: 0.3, start_y: 0.8, end_x: 0.3, end_y: 0.2, duration: 200).perform
end
