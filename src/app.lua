-- connect to MQTT broker, and begin handling events
print("DHTxx temp & humidity sensor over MQTT")

-- attempt to sync time via SNTP
function sync_time(callback)
	sntp.sync({ '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' },
		function(sec, usec, server, info)
			tm = rtctime.epoch2cal(sec)
			print("SNTP sync succeeded, time is " .. string.format("%02d/%02d/%04d %02d:%02d:%02d UTC", tm["mon"], tm["day"], tm["year"], tm["hour"], tm["min"], tm["sec"]))
			if callback then callback() end
		end,
		function(code, msg)
			print("SNTP sync failed:" .. msg)
		end
	)
end

sync_time(function()
	dofile("mqtt.lua")
end)
