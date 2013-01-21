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

| Scoring Description | Axes | item1 | item2 .. | itemN |
| (what axis 1 means) | Axis 1 name | item1 axis1 | item2 axis1 .. | itemN axis1 |
| (what axis 2 means) | Axis 2 name | item1 axis2 | item2 axis2 .. | itemN axis2 |
| ignored | Totals | =SUM(C2:C9) | =SUM(D2:D9) | .. |

You can have arbitrarily many axes and items but the header field setup should be the same and the last row needs to be 
the totals.
