// JavaScript Document

// Date: 2014-11-07
// Author: Agnes Xu


i = 0;
j = 0;
count = 0;
MM = 0;
SS = 60;  // 秒 90s
MS = 0;
totle = (MM+1)*600;
d = 180*(MM+1);
MM = "0" + MM;
var gameTime = 3;

var countDown = function() {
    //80*80px 时间进度条
    i = 0;
    j = 0;
    count = 0;
    MM = 0;
    SS = gameTime;
    MS = 0;
    totle = (MM + 1) * gameTime * 10;
    d = 180 * (MM + 1);
    MM = "0" + MM;
    $(".time").html('跳过');
    start1();
    t1 = setInterval("start1()", 100);
}