// 以下のコードをテキトウな RCファイル 等に書く
// RC ファイルに
// :cabbrev -javascript gitio userContenx.gitio()
 
userContext.gitio = function gitioShortener (aURL, aCode, aCallback) {
	var xhr = new XMLHttpRequest,
	form = new FormData;
	xhr.open("POST", "http://git.io", !!aCallback);
	if (aCallback) {
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4 && xhr.status === 201) {
				aCallback(xhr.getResponseHeader("Location"));
			}
		}
	}
	form.append("url", aURL || buffer.URL);

	if (typeof aCode === "string" && aCode)
		form.append("code", aCode);
	
	xhr.send(form);
	if (!aCallback && xhr.status === 201) {
		var ret = xhr.getResponseHeader("Location");
      liberator.echo('Shorten URL to \"'+ret+'\"');
		return ret;
	}
};
