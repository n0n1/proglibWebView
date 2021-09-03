//
//  JSUserScripts.swift
//  proglibWebView
//
//  Created by Ivan Telenkov on 03.09.2021.
//

import Foundation

let getHeaderTitle  = """
function getHeaderTitle() {
	let headerTitle = document.querySelector('h1.title');
	return headerTitle.innerText;
}
getHeaderTitle();
"""

let hideHeaderTitle = """
function hideHeaderTitle() {
	let headerTitle = document.querySelector('h1.title');
	headerTitle.style.display = 'none';
}
hideHeaderTitle();
"""
