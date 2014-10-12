scriptId = 'com.thauser.myo.scripts.hearthstone-beta'

function leftDown()
	if myo.mouseControlEnabled() then
		myo.mouse("left","down")
		-- make sure that any altTabMenu call's keyboard "down" is cleared. probably a better solution available somehow
		myo.debug(scriptId .. ":leftDown() : Left click down!")
	end
end

function leftRelease()
	if myo.mouseControlEnabled() then
		myo.mouse("left", "up")
		myo.debug(scriptId .. ":leftRelease() : Left click released!")
	end
end

function rightDown()
	if myo.mouseControlEnabled() then
		myo.mouse("right", "down")
		myo.debug(scriptId .. ":rightDown() : Right button down!")
	end
end

function rightRelease()
	if myo.mouseControlEnabled() then
		myo.mouse("right", "up")
		myo.debug(scriptId .. ":rightRelease() : Right button released!")
	end		
end

function toggleMouseControl()
	myo.controlMouse(not myo.mouseControlEnabled())
	myo.debug(scriptId .. ":toggleMouseControl() : Set mouse control to " .. string.format("%s", (myo.mouseControlEnabled()) and "true" or "false"))
end	

function onPoseEdge(pose, edge)
    if pose == "fingersSpread" then
		if edge == "on" then
			leftDown()
		end 
		if edge == "off" then 
			leftRelease()
		end 
	end
	
	if pose == "waveOut" then
		if edge == "off" then 
			rightRelease()
		end
		if edge == "on" then
			rightDown()
		end
	end
	
	if pose == "fist" then
		if edge == "off" then
			toggleMouseControl()
		end
	end 
end

function onForegroundWindowChange(app,title)
	waitTime = myo.getTimeMilliseconds()
	local wantActive = false
	appName = app
	--if string.match(title,"Program Manager") or string.match(title,"Battle.net") or string.match(title, "Hearthstone") then
	   wantActive = true
	--end
	-- roooooofl
	myo.debug("Script: " .. scriptId .. " | App: " .. app .. " | Title: " .. title .. " | wantActive: " .. string.format("%s", wantActive and "true" or "false"))
 	return wantActive
end