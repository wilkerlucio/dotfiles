function FindProxyForURL(url, host) {
  // All requests should go to their specified
  // destination by default
  var proxy_setting = "DIRECT"

  if (host.match(new RegExp(".local$"))) {
    proxy_setting = "PROXY localhost"
  }
  
  return proxy_setting
}