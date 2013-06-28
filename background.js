// Page Action?

chrome.tabs.onUpdated.addListener(function(tabId, changeInfo, tab) {
    if (tab.url.indexOf('facebook') != -1) {
        // page action show
        chrome.pageAction.show(tabId);
    }
});

// Clicked?
// クリックしたらマウスオーバーでメモが表示されるようにしたい
