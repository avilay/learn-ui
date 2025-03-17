// Console logs will be visible in the popup's inspector window

let changeColor = document.getElementById("changeColor");

console.log("Changing the color of the button itself.")
chrome.storage.sync.get("color", ({ color }) => {
  changeColor.style.backgroundColor = color;
});

console.log("Adding event listener to button.");
changeColor.addEventListener("click", async () => {
  let [tab] = await chrome.tabs.query({active: true, currentWindow: true});
  chrome.scripting.executeScript({
    target: {tabId: tab.id},
    function: setPageBackgroundColor
  });
});

function setPageBackgroundColor() {
  // Console logs here will be visible in the target page's inspector window
  console.log("APTG DEBUG: Inside setPageBackgroundColor");
  chrome.storage.sync.get("color", ({ color }) => {
    document.body.style.backgroundColor = color;
  });
};