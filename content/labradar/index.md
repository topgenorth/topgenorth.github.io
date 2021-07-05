---
categories: ["Firearms"]
tags: ["reloading", "ballistics", "labradar"]
comments: true
date: "2021-06-19"
title: "Labradar Data"
sidebar: false
---

The [Labradar](http://mylabradar.com) can be a very useful tool for the handloader or the long range shooter. This section holds some of the data that I've captured using a Labradar.

<table>
	<thead>
		<tr>
			<th style="text-align:center">Series Number</th>
			<th style="text-align:left">Cartridge</th>
			<th style="text-align:left">Ammo</th>
			<th style="text-align:left">Firearm</th>
			<th style="text-align:center">Date</th>
		</tr>
	</thead>
	<tbody>

	{{ range $.Site.Data.labradar }}
		{{ partial "labradar-row.html" . }}
	{{ end }}		

	</tbody>
</table>