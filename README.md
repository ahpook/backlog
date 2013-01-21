# Backlog Spider Charts

## What is this?

This is a deeply over-engineered way to display a product backlog. It builds [Spider 
graphs](http://en.wikipedia.org/wiki/Radar_chart) to score potential work items on multiple axes and lets you overlay 
them for easy quantitative comparison. 

## What do I need?

* A google docs spreadsheet in a particular format (see below)
* [Sinatra](http://sinatrarb.com) and some means of using it (`bundle install` should take care of this for you)
* A weird dedication to data visualisation

## What should the doc look like?

<!-- sorry, tables -->
<table>
<tr><th> Scoring Description </th><th> Axes </th><th> item1 </th><th> item2 .. </th><th> itemN </th></tr>
<tr><td> (what axis 1 means) </td><td> Axis 1 name </td><td> item1 axis1 </td><td> item2 axis1 .. </td><td> itemN axis1 </td></tr>
<tr><td> (what axis 2 means) </td><td> Axis 2 name </td><td> item1 axis2 </td><td> item2 axis2 .. </td><td> itemN axis2 </td></tr>
<tr><td> ignored </td><td> Totals </td><td> =SUM(C2:C9) </td><td> =SUM(D2:D9) </td><td> .. </td></tr>
</table>

You can have arbitrarily many axes and items but the header field setup should be the same and the last row needs to be 
the totals.
