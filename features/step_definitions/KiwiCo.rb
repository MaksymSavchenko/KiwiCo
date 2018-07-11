
Given(/^"([^"]*)" with title "([^"]*)"$/) do |url, expected_title|
   driver.manage().delete_all_cookies();
   driver.get(url)
   title = driver.title
   #expected_title = %q[KiwiCo | Hands-On Learning & Experience Based Play]
   #expected_title = expected_title
    if title == expected_title
    puts "Title is correct: \"#{title}\""
    else
    puts "Title is incorrect: \"#{title}\""
    end
 end

 Then(/^clear email field$/) do
   find_element(:id, "newsletter_popup").clear
 end

 Then(/^"([^"]*)" should appear$/) do |value|
    sleep 10
    text = find_element(:xpath => '//*[@id="newsletter_share_thankyou"]/h2[2]').text
   if
     text == value
     puts "message #{value} displayed"
   elsif
     puts "next message #{element} displayed"
   end
  end


 Then(/^select month and year$/) do
   find_element(:id, "newsletter-cricket-month").find_element(:css,"option[value='03']").click
   find_element(:id, "newsletter-cricket-year").find_element(:css,"option[value='2017']").click
 end


Then(/^close banner Join our Newsletter by clicking out of popup$/) do
  sleep 9
  driver.action.move_by(29, 215).click.perform
  driver.action.move_by(29, 215).click.perform
end

Then(/^scroll to Sign up for emails form$/) do
    driver.find_element(:xpath => '//*[@id="page-footer"]/div/small').location_once_scrolled_into_view
    sleep 1
#    driver.find_element(:id, 'newsletter').click
#    sleep 5
end

Then(/^click Go$/) do
  find_element(:id, 'newsletter-submit').click
end

Then(/^banner Join our Newsletter and get "([^"]*)"% off! should appear$/) do |arg1|
   sleep 10
   banner = driver.find_element(:id, 'intl-newsletter-lightbox-banner')
   puts "#{arg1}% off! banner is on the place"
 end

Then(/^enter email address "([^"]*)"$/) do |value|
    sleep 1
    element = find_element(:id, 'newsletter_popup')
    element.click
    element.send_keys value
    find_element(:id, 'lightboxsubmit').click
    sleep 1
    puts "30% off! banner is on the place"
 end

 Then(/^"([^"]*)" displays in red in modal$/) do |value|
   element = find_element(:xpath => '//*[@id="lightbox_newsletter_form"]/div/label').text
  if
    element == value
    puts "message #{value} displayed"
  elsif
    puts "next message #{element} displayed"
  end
 end

Then(/^captcha appears$/) do
puts "captcha is not covered yet"
end

Then(/^Your Welcome Promo: "([^"]*)"% off your 1st Month is applied$/) do |arg1|
  sleep 1
  find_element(:xpath => '//*[@id="newsletter_share_thankyou"]/p[3]')
puts "Your Welcome Promo: #{arg1}% off your 1st Month is applied"
end

Then(/^click close button$/) do
button = find_element(:xpath => '//*[@id="newsletter_lightbox_2016"]/div[2]/div/button').click
end

Then(/^select cricket$/) do
  sleep 1
  find_element(:xpath => '//*[@id="pick_newsletter_brands"]/ol/li[1]/label/span[2]').click
end


Then(/^select koala$/) do
  sleep 1
  find_element(:xpath => '//*[@id="pick_newsletter_brands"]/ol/li[2]/label').click
end

Then(/^click go$/) do
find_element(:xpath => '//*[@id="pick_newsletter_brands"]/button').click
end

Then(/^scroll$/) do
  sleep 1
  find_elements(:xpath => '//*[@id="pick_newsletter_brands"]/a').last.location_once_scrolled_into_view
end

Then(/^close banner Join our Newsletter$/) do
  sleep 10
  find_element(:xpath => '//*[@id="newsletter_lightbox_2016"]/div[2]/div/button').click
end

Then(/^click Save today$/) do
  sleep 1
  find_element(:id, 'show-unlock-modal').click
  # //*[@id="show-unlock-modal"]
end

Then(/^click no thanks$/) do
  find_element(:xpath => '//*[@id="pick_newsletter_brands"]/a').click
end
