-- get credentials and topic
dofile("mqtt_secrets.lua")

-- set up MQTT event callbacks, connect and subscribe
m=mqtt.Client(cid,120,uid,pwd)
m:on("connect",function(client) print("connect") end)
m:on("offline",function(client) print("offline") end)

m:connect("io.adafruit.com",8883,1,1,
	function(client)
		print("connected")
	end,
	function(client,reason) print("connection failed:"..reason) end) 
