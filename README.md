# DemoApp

## Business 

The app displays 1)articles, 2)pictures, 3)daily inspiration, 4)daily quote, and 5)weekly journal 
Articles are categorzied into : Pictures, sports, others, etc...(so pictures are articles)

There are 4 API calls in order to generate the main view


## UI/UX

1)Show today's local articles and pictures
    1) If found, generate view and call API in background
    2) If not, load from remote and cache them and generate view

2)Call daily inspiration, if found show button 
3)Call for daily quote, if found show button
4)Call weekly journal, if found show button

Pictures are generated in a collection view 

Table view has 2 sections : 
1) Article options(dynamic), daily inspiration(dynamic)
2) Search the journal (static), daily quote(dynamic), weekly quote(dynamic)


## Summary
Chart: 

![Chart](Diagram.png)