<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title =Yii::t('app','About');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-sm-4">

            <!-- normal -->
            <div class="ih-item square effect4"><a href="#">
                <div class="img"><img src="../../img/anh22.jpg" alt="img"></div>
                <div class="mask1"></div>
                <div class="mask2"></div>
                <div class="info">
                  <h3><?=Yii::t('app','Heading here')?></h3>
                  <p><?=Yii::t('app','Description goes here')?></p>
                </div></a>
            </div>
            <!-- end normal -->

        </div>
        <div class="col-sm-4">

            <!-- colored -->
            <div class="ih-item square colored effect4"><a href="#">
                <div class="img"><img src="../../img/anh12.jpg" alt="img"></div>
                <div class="mask1"></div>
                <div class="mask2"></div>
                <div class="info">
                  <h3><?=Yii::t('app','Heading here')?></h3>
                  <p><?=Yii::t('app','Description goes here')?></p>
                </div></a>
            </div>
            <!-- end colored -->

        </div>
        <div class="col-sm-4">

            <!-- colored -->
            <div class="ih-item square colored effect4"><a href="#">
                <div class="img"><img src="../../img/anh32.jpg" alt="img"></div>
                <div class="mask1"></div>
                <div class="mask2"></div>
                <div class="info">
                  <h3><?=Yii::t('app','Heading here')?></h3>
                  <p><?=Yii::t('app','Description goes here')?></p>
                </div></a>
            </div>
            <!-- end colored -->

        </div>
    </div>
</div>

<!DOCTYPE html>
<meta charset="utf-8">
<style>

body {
  font: 10px sans-serif;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  display: none;
}

.line {
  fill: none;
  stroke: steelblue;
  stroke-width: 1.5px;
}

</style>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"></script>
<script>

var margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var parseDate = d3.time.format("%d-%b-%y").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.close); });

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.tsv("../data/data.tsv", function(error, data) {
  if (error) throw error;

  data.forEach(function(d) {
    d.date = parseDate(d.date);
    d.close = +d.close;
  });

  x.domain(d3.extent(data, function(d) { return d.date; }));
  y.domain(d3.extent(data, function(d) { return d.close; }));

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Price ($)");

  svg.append("path")
      .datum(data)
      .attr("class", "line")
      .attr("d", line);
});

</script>
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  </body>
</html>
<div class="col-sm-5">
    <?php
    use scotthuangzl\googlechart\GoogleChart;

    echo GoogleChart::widget(array('visualization' => 'PieChart',
        'data' => array(
            array('Task', 'Hours per Day'),
            array('Work', 11),
            array('Eat', 2),
            array('Commute', 2),
            array('Watch TV', 2),
            array('Sleep', 7)
        ),
        'options' => array('title' => 'My Daily Activity')));
    echo GoogleChart::widget(array('visualization' => 'LineChart',
        'data' => array(
            array('Task', 'Hours per Day'),
            array('Work', 11),
            array('Eat', 2),
            array('Commute', 2),
            array('Watch TV', 2),
            array('Sleep', 7)
        ),
        'options' => array('title' => 'My Daily Activity')));

    echo GoogleChart::widget(array('visualization' => 'LineChart',
        'data' => array(
            array('Year', 'Sales', 'Expenses'),
            array('2004', 1000, 400),
            array('2005', 1170, 460),
            array('2006', 660, 1120),
            array('2007', 1030, 540),
        ),
        'options' => array(
            'title' => 'My Company Performance2',
            'titleTextStyle' => array('color' => '#FF0000'),
            'vAxis' => array(
                'title' => 'Scott vAxis',
                'gridlines' => array(
                    'color' => 'transparent'  //set grid line transparent
                )),
            'hAxis' => array('title' => 'Scott hAixs'),
            'curveType' => 'function', //smooth curve or not
            'legend' => array('position' => 'bottom'),
        )));
    echo GoogleChart::widget( array('visualization' => 'Gauge', 'packages' => 'gauge',
        'data' => array(
            array('Label', 'Value'),
            array('Memory', 80),
            array('CPU', 55),
            array('Network', 68),
        ),
        'options' => array(
            'width' => 400,
            'height' => 120,
            'redFrom' => 90,
            'redTo' => 100,
            'yellowFrom' => 75,
            'yellowTo' => 90,
            'minorTicks' => 5
        )
    ));
    echo GoogleChart::widget( array('visualization' => 'Map',
        'packages'=>'map',//default is corechart
        'loadVersion'=>1,//default is 1.  As for Calendar, you need change to 1.1
        'data' => array(
            ['Country', 'Population'],
            ['China', 'China: 1,363,800,000'],
            ['India', 'India: 1,242,620,000'],
            ['US', 'US: 317,842,000'],
            ['Indonesia', 'Indonesia: 247,424,598'],
            ['Brazil', 'Brazil: 201,032,714'],
            ['Pakistan', 'Pakistan: 186,134,000'],
            ['Nigeria', 'Nigeria: 173,615,000'],
            ['Bangladesh', 'Bangladesh: 152,518,015'],
            ['Russia', 'Russia: 146,019,512'],
            ['Japan', 'Japan: 127,120,000']
        ),
        'options' => array('title' => 'My Daily Activity',
            'showTip'=>true,
        )));
    ?>
</div>
