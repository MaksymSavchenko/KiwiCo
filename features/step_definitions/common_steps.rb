Then(/^clear browser data$/) do
  %x[adb shell pm clear com.android.chrome]
end

Then(/^click "([^"]*)"$/) do |value|
  text(value).click
end
Then(/^click exact "([^"]*)"$/) do |value|
  text_exact(value).click
end

Then(/^pry$/) do
  pry
end

Then(/^type "([^"]*)" to id "([^"]*)"$/) do |value, id|
 	find_element(id: id).send_keys(value)
end

Then(/^click on id if present "([^"]*)"$/) do |id|
  if_id_present_click(id)
end

Then(/^scroll and open "([^"]*)"$/) do |value|
  find_element_in_list(value)
  text(value).click
end

Then(/^scroll to top and open "([^"]*)"$/) do |value|
  find_element_in_list_full(value)
  text(value).click
end

Then(/^open "([^"]*)"$/) do |value|
  text(value).click
end

Then(/^wait "([^"]*)" seconds$/) do |time|
  sleep time.to_i
end

Then(/^go back "([^"]*)" times$/) do |value|
$i = 0
$num = value.to_i
  while $i < $num  do
  Appium::Driver.press_keycode(4)
  sleep 0.2
  $i +=1
  end
end

Then(/^click enter$/) do
  Appium::Driver.press_keycode(66)
end

Then(/^run config script$/) do
  system("./features/support/prepare_device.sh")
  #{}%x[./Users/msavchenko/Documents/appium-settings_2/features/support/prepare_device.sh]
end

Then(/^"([^"]*)" "([^"]*)" element in list "([^"]*)"$/) do |action, menu, element|
  find_element_in_list(menu)
  actual_state = find_elements(id: "switch_widget")[element.to_i].attribute("checked")
  sleep 0.2
    if action == "disable" and actual_state == "true"
      find_elements(id: "switch_widget")[element.to_i].click
      puts "#{menu} is disabled"
    elsif action == "enable" and actual_state == "false"
      find_elements(id: "switch_widget")[element.to_i].click
      puts "#{menu} is enabled"
    else
      puts "#{menu} was #{action}d, no action needed"
    end
end

Then(/^"([^"]*)" "([^"]*)" element by class: "([^"]*)" element in list "([^"]*)" and click on id "([^"]*)"$/) do |action, menu, id, element, id_2|
  find_element_in_list(menu)
  actual_state = find_elements(class_name: id)[element.to_i].attribute("checked")
  sleep 0.2
    if action == "disable" and actual_state == "true"
      find_elements(class_name: id)[element.to_i].click
      #if_id_present_click(id_2)
      puts "#{menu} is disabled"
    elsif action == "enable" and actual_state == "false"
      find_elements(class_name: id)[element.to_i].click
      #if_id_present_click(id_2)
      puts "#{menu} is enabled"
    else
      puts "#{menu} was #{action}d, no action needed"
    end
end

Then(/^disable "([^"]*)" element in list "([^"]*)"$/) do |value, element|
  find_element_in_list(value)
  actual_state = find_elements(id: "switch_widget")[element.to_i].attribute("checked")
  if actual_state == "true"
    find_elements(id: "switch_widget")[element.to_i].click
  elsif actual_state == "false"
    puts "#{value} is already disabled"
  end
end

Then(/^scroll and tap on "([^"]*)" "([^"]*)" times$/) do |value, times|
  sleep 0.5
  find_element_in_list(value)
  build_number = text(value)
  $i = 0
  $num = times.to_i
  while $i < $num  do
  build_number.click
  $i +=1
  end
end

def if_id_present_click(id)
  state = find_elements(id: id).size
    if state == 0
			puts "Element with id: \"#{id}\" not found"
			Appium::Driver.press_keycode(4)
		elsif state == 1
			puts "Element with id: \"#{id}\" found"
			find_element(id: id).click
		else
			puts "something went wrong"
		end
end

def if_text_present_click(text)
  state = find_elements(xpath: "//android.widget.TextView[@text='#{text}']").size
    if state == 0
			puts "Element with \"#{text}\" not found"
		elsif state == 1
			puts "Element with text \"#{text}\" found"
			find_element(xpath: "//android.widget.TextView[@text='#{text}']").click
		else
			puts "something went wrong"
		end
end

def if_text_not_present(text)
  state = find_elements(xpath: "//android.widget.TextView[@text='#{text}']").size
    if state == 0
			puts "Element with \"#{text}\" not found"
			Appium::Driver.press_keycode(4)
		elsif state == 1
			puts "Element with text \"#{text}\" found"
		else
			puts "something went wrong"
		end
end

def find_my_element(element_text)
	unless exists{text_exact(element_text)}
		fail("Element with \"#{element_text}\" not found")
	end
end

def find_element_in_list(element_text)
	current_screen = get_source
	previous_screen = ""
	until exists{text(element_text)}||(current_screen == previous_screen) do
	  Appium::TouchAction.new.swipe(start_x: 0.3, start_y: 0.75, end_x: 0.3, end_y: 0.5, duration: 300).perform
		sleep 0.5
		previous_screen = current_screen
		current_screen = get_source
	end
	unless exists{text_exact(element_text)}
		fail("Element with \"#{element_text}\" not found")
	end
end


def find_element_in_list_full(element_text)
	current_screen = get_source
	previous_screen = ""
	until current_screen == previous_screen do
Appium::TouchAction.new.swipe(start_x: 0.3, start_y: 0.2, end_x: 0.3, end_y: 0.8).perform
		previous_screen = current_screen
		current_screen = get_source
	end
	current_screen = get_source
	previous_screen = ""
	until exists{text_exact(element_text)}||(current_screen == previous_screen) do
	  Appium::TouchAction.new.swipe(start_x: 0.3, start_y: 0.8, end_x: 0.3, end_y: 0.5, duration: 300).perform
		sleep 0.5
		previous_screen = current_screen
		current_screen = get_source
	end
	unless exists{text_exact(element_text)}
		fail("Element with \"#{element_text}\" not found")
	end
end
