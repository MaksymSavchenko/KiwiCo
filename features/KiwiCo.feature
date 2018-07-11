@KiwiCo

Feature: Welcome screen
#
# Scenario: User is able to Join our Newsletter and get 50% off
# Given "https://stg.kiwico.com/" with title "KiwiCo | Hands-On Learning & Experience Based Play"
# Then banner Join our Newsletter and get "50"% off! should appear
# Then enter email address "anna+appium@kiwico.com"
# Then select koala
# Then scroll
# Then click go
# Then Your Welcome Promo: "50"% off your 1st Month is applied
# Then wait "5" seconds
#
#
# Scenario: User is able to submit "Save today" wiggling
# Given "https://stg.kiwico.com/" with title "KiwiCo | Hands-On Learning & Experience Based Play"
# Then close banner Join our Newsletter
# Then click Save today
# Then enter email address "anna+appium@kiwico.com"
# Then scroll
# Then click no thanks
# Then Your Welcome Promo: "50"% off your 1st Month is applied
# Then wait "3" seconds
#
#
# Scenario: 30% Welcome Promo Normal Sign Up (negative; invalid email entry)
# Given "https://stg.kiwico.com/tinker" with title "Monthly Science Kits for Kids Ages 9-16"
# Then close banner Join our Newsletter by clicking out of popup
# Then click Save today
# Then enter email address "Fred@Banana"
# Then "Please enter your email address" displays in red in modal
# Then wait "3" seconds
#
#
# Scenario: 30% Welcome Promo Normal Sign Up (valid email entry)
# Given "https://stg.kiwico.com/jobs" with title "Jobs"
# Then scroll to Sign up for emails form
# Then type "anna+appium@kiwico.com" to id "newsletter"
# Then click Go
# Then select cricket
# Then select month and year
# Then scroll
# Then click go
# Then "Spread the word and save even MORE!" should appear
# Then wait "3" seconds


Scenario: 30% Welcome Promo Normal Sign Up (invalid/valid email entry)
Given "https://stg.kiwico.com/cricket" with title "Cricket Crate by KiwiCo | Spark early learning for babies and toddlers"
Then close banner Join our Newsletter by clicking out of popup
Then click Save today
Then enter email address "Fred@Banana"
Then "Please enter your email address" displays in red in modal
Then clear email field
Then enter email address "anna+appium@kiwico.com"
Then select cricket
Then select month and year
Then scroll
Then click go
Then "Spread the word and save even MORE!" should appear
Then click close button
Then click get it button find_element(:xpath => '//*[@id="sticky-page-nav"]/div/ol/li[6]/a').click
Then pry






# 5.    Reenter a valid email address and click ""Go
# 6.    Confirm ""Spread the word and save even MORE!""
#        lighbox opens
# 7.    Close the above lighbox
# 8.    Confirm ""Your Welcome Promo: 30% off your 1st Month is
#        applied. Get it »"" is present at top
# 9.    Click ""Get It""
# 10.  Confirm page scroll to the ""Shop Now"" section"
