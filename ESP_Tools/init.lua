file.remove("eus_params.lua")
wifi.sta.clearconfig()
enduser_setup.stop()

wifi.eventmon.register(wifi.eventmon.STA_CONNECTED, function(T)
  print("\n\tSTA - CONNECTED" .. "\n\tSSID: " .. T.SSID .. "\n\tBSSID: " ..
    T.BSSID .. "\n\tChannel: " .. T.channel)

  p = dofile('eus_params.lua')
  print("Timeout in seconds: " .. p.timeout)
  tmr.softwd(p.timeout)
end)

enduser_setup.start(
  "ESP_STA_001",
  function()
    print("Connected to WiFi as:" .. wifi.sta.getip())
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end
)
