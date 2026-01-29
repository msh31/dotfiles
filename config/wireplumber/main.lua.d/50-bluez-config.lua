-- WirePlumber config for high-quality Bluetooth audio (A2DP only)
bluez_monitor.properties = {
  ["bluez5.enable-sbc-xq"] = true,
  ["bluez5.enable-msbc"] = false,  -- Disable HSP/HFP to force A2DP
  ["bluez5.enable-hw-volume"] = true,
  ["bluez5.headset-roles"] = "[ ]",  -- Disable headset roles
  ["bluez5.a2dp-codecs"] = "[ aac sbc sbc_xq ]",
  ["bluez5.a2dp-profiles"] = "[ a2dp-sink a2dp-source ]",
  ["bluez5.disable-headset"] = true,  -- Force disable HSP
}