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
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2020-05-24T21:32:34.688Z\&quot; agent=\&quot;5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\&quot; etag=\&quot;2R6ntz_fz3JbSlk8PWt9\&quot; version=\&quot;13.1.3\&quot; type=\&quot;google\&quot;&gt;&lt;diagram id=\&quot;RKpFGRpc1l0SeD8t9Z7a\&quot; name=\&quot;Page-1\&quot;&gt;7Vxbc+I2FP41zLQPm7El33hMCLttJ5lJm16yj4otQI2xqBAL9NevhGWMLZNxIFi2N0+g45v4vqNzlRnA0XzzhaHF7J5GOB4AK9oM4O0AANt3oPiQkq2SAMtKJVNGIiXLBY/kf6yE2WkrEuFl4UROaczJoigMaZLgkBdkiDG6Lp42oXHxqQs0VU+0csFjiGKsnfYPifgslQbuwdm/YDKdZU+2s983R9nJSrCcoYiuD0RwPIAjRilPv803IxxL9DJc0us+Hzm6nxjDCa9zwfXTemjd21/I2AF/vfjedXzz3ycnvcs3FK/UD1aT5dsMARwJQNSQMj6jU5qgeJxLbxhdJRGWj7HEKD/njtKFENpC+C/mfKvYRStOhWjG57E6OqEJVwfBbkzieERjynYzgJMJ9sJQyJec0Rd8cCTyh8+WfGg6aznVo+go0ZKuWIhfgSTTMsSmmL9yHtxzKLQf0znmbCuuYzhGnHwrzgMpLZzuz8uJEl8UV2/gzesCbxHCwaSSNy8M8PPEDG+uSd6CVvKGN4Q/ydtdAVcNv6q7y++3m8PBVg06QbZvkmzbNkFuTqb/BjK7uJKHJsnNbtyypVwmzsVB5FQRF4Bn6HlmiDuIf0ww57ZoWdr9W5bAaGQEApPs2ocW98p9E7mCELZ9yi+Uw73lloP8NrtRpxwxONdYq0sfKBFTBJbKMD1PZVcqv4TZOLtFOjF1VUm19tM4w8VrTuAekURI/iZ4LT5GgmNG4xgzTSuLOreeEY4fF2gH9lok06+befVYzDjevM6hDrm6AAZF6OyhGq/zPNd2la2cHeS4ZYjfb+laGprXYhFuOQmX7wvfqV7yPMAzMMu6egh4Vj5oBPChhvef6FkAfDm9PdVWnQW86xc1vQr3RhXd13C/RRw/kPBF4t0v8PcFv7aAD10NfRMRQ/dzcLem64eOyXgQeibjwbOS8GMB4f5YGwPC2lpxbmmmOiB0naK52QcVDQWEunEZSUseckKTB9lr6Jl5h14xqKky70GFefcvZt71lkbOgJSngXmEYzwVTlc+TIwQR0qzu08JKC+BqsC+UU7sjzZTdfuohp20jVZTbMO1MnB6reydyikt1QrvIt7TLgXrrtVwOcVvUbD2oW45L5ep3sFhSd3sZtUN6In4h1+qqRLgXAt0XpSnEXdHUYTZZeuEtZk4K36zhzXqhLDRwqy+3eQ3oUdCx4UwBX4g8ywvFjO5eRYDbyq//ZRQudojmuCf+0CMf1Vixq3JTHCxbKedXejTAjiju77q2j1otHcNjdD74wZI9dXi3DTtSITklqrnTsMBue5orxknYSy7FXzF8IED6L59LzneffZjzPE6oJXm3WyAatVcks4Rthuy1BXN7HTlZOulHC2N6HxBl4RftgbZ0FICR+xWYSk12et22lmD7F6k5NTd8uMYrVw67dwif1oo1Q2+je6sd/RM6Ae2t35g3N7qndA/8JxKtC1FTK9iR78YOw5BBQFeowR06l2TNhvAujmgY/RtE1cPONvFd2ccXm2+jb6A4uip+QiFM2lVb3FIGeK0D4a15Ngq7Wqzjk3fNXtHw10pvI9+rdQRtq3KbkSjBOhduz5HFp+GdRhwmmTA1nOrX5Plggibk26y6g34pa1U5iuCtm59bhGJ5ZR/X6VroDfgw9ahD3Sf+7ggSbLrfzaAezMbCJ3S+xLmX1QButaPGZPxjXrRqvOYu0OtuWwcdahrew+7PqD8dlBVqdpuFHc9wFFbx8N063gP9N1pcJOyGOZ/s5N2RvN/K4Lj7w==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://app.diagrams.net/js/viewer.min.js"></script>
