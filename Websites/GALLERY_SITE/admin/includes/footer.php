</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- dropzone scripts -->
<script src="js/dropzone.js"></script>

<!-- custom scripts -->
<script src="js/scripts.js"></script>

<!-- Google Charts -->
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['Views',     <?php echo $session->count; ?>],
            ['Photos',      <?php echo Photo::count_all(); ?>],
            ['User',  <?php echo User::count_all(); ?>],
            ['Comments', <?php echo Comment::count_all(); ?>]
        ]);

        var options = {
            legend:'none',
            pieSliceText: 'label',
            backgroundColor: 'transparent',
            title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
    }
</script>

</body>




</html>
