Before do
#	puts "cleaning browser data"
#	%x[adb shell pm clear com.android.chrome]
	$driver.start_driver

end

After do |scenario|
	if scenario.failed?
		if !File.directory?("screenshots")
			FileUtils.mkdir_p("screenshots")
		end

		time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
		screenshot_name = "#{time_stamp}.png"
		screenshot_file = File.join("screenshots", screenshot_name)
		$driver.screenshot(screenshot_file)
		Image.resize(screenshot_file, screenshot_file, 480, 640)
		embed("#{screenshot_file}", "image/png")
	end
	$driver.driver_quit
#	%x[adb shell pm uninstall io.appium.unlock]
#  %x[adb shell pm uninstall io.appium.settings]
end

AfterConfiguration do
	FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end
