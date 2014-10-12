scriptId = 'com.thauser.myo.scripts.browser-control'

function webBack()
	myo.keyboard("left_arrow", "press","alt")
	myo.debug("webBack() : Navigate to previous webpage")
end

function nextTab()
	myo.keyboard("tab", "press", "control")
	myo.debug("nextTab() : Switch to next tab")
	
end

function newTab()
	myo.keyboard("t", "press", "control")
	myo.debug("newTab() : Open new tab")
end
	

function onPoseEdge(pose, edge)
    if pose == "waveIn" then
		if edge == "off" then 
			webBack()
		end 
	end
	
	if pose == "waveOut" then
	    if edge == "off" then 
			nextTab()
		end 
	end 
	
	if pose == "fist" then
		if edge == "off" then
	    	newTab()
		end 
	end
end

function onForegroundWindowChange(app,title)
	waitTime = myo.getTimeMilliseconds()
	local wantActive = false
	appName = app
	if string.match(title,".*Google Chrome$") then
		wantActive = true
	end
	-- roooooofl
	myo.debug("App: " .. app .. " | Title: " .. title .. " | wantActive: " .. string.format("%s", wantActive and "true" or "false"))
 	return wantActive
end