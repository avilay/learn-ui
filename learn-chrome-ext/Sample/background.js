// Console logs here will be visible in the extension's inspector
let color = "#eb34cc";

chrome.runtime.onInstalled.addListener(() => {
  chrome.storage.sync.set({color});
  console.log(`Default background color is now set to ${color}`);
});
