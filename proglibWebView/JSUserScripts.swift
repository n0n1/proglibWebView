//
//  JSUserScripts.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 03.09.2021.
//

import Foundation

let getHeaderTitle  = """
function getHeaderTitle() {
	const headerTitle = document.querySelector('h1.title');
	return headerTitle.innerText;
}
getHeaderTitle();
"""

let hideHeaderTitle = """
function hideHeaderTitle() {
	const headerTitle = document.querySelector('h1.title');
	headerTitle.style.display = 'none';
}
hideHeaderTitle();
"""

// use this block with  callAsyncJavaScript  //

let hideAnyElement  = """
	const element = document.querySelector(selector);
	element.style.display = 'none';
"""

let getElementInnerText = """
	const element = document.querySelector(selector);
	return element.innerText;
"""

let setTimeoutFor = """

	const myPromise = new Promise((resolve, reject) => {
        window.setTimeout(() => {
		  resolve('foo');
		}, timeout);
	  });

	
	 await myPromise;
	 return myPromise;
"""
