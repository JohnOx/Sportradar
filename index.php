<?php require_once './config/db_connect.php'?>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sportradar - Coding Challenge: Sportcalendar</title>

    <!-- BOOTSTRAP -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            }
    </style>

</head>


<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light bg-dark text-light">
    <a class="navbar-brand text-light" href="#">Sportcalendar</a>

        <button class="navbar-toggler text-light" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    <div class="collapse navbar-collapse text-light" id="navbarNav">
        <ul class="navbar-nav text-light">

            <li class="nav-item active">
                <a class="nav-link text-light" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="#">Events</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="#">Sports</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="#">Stars</a>
            </li>
        
        </ul>
    </div>
</nav><!-- NAVBAR -->


<main class="container-fluid">
    <h1>Events</h1>
    
    <hr>

    <!-- Sort Filter Form -->
    <form name="sort" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <select name="order">
            <option>Make A Selection</option>
            <option value="event_type">Sportstype</option>
            <option value="event_date">Date</option>
            <option value="team_name">Team</option>
            <option value="country">Country</option>
        </select>
        <input type="submit" value=" - Sort - " />
    </form>

    <table class="table table-striped">
    <thead class="thead-dark">
        <tr>
        <th scope="col">Sportstype</th>
        <th scope="col">Event-Title</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Who is playing?</th>
        <th scope="col">Playground</th>
        <th scope="col">Where</th>
        <th scope="col">Country</th>
        </tr>
    </thead>

    <tbody>
        <?php

        $sort = @$_POST['order']; 
        // Queries
        if (!empty($sort)) {
            $sql = "SELECT  event_type, 
                            event_name, 
                            event_date, 
                            event_time, 
                            playground, 
                            address, 
                            country, 
                            team_name 
                            FROM event 
                            inner join location on event.event_id = location.location_id 
                            inner join team on event.event_id = team_id
                            ORDER BY $sort ASC";
        } else {
            
            $sql = "SELECT  event_type, 
                            event_name, 
                            event_date, 
                            event_time, 
                            playground, 
                            address, 
                            country, 
                            team_name 
                            FROM event 
                            inner join location on event.event_id = location.location_id 
                            inner join team on event.event_id = team_id";
        }

            $display = mysqli_query($con, $sql);

            if($display -> num_rows == 0) {
                echo "No data to display!";
                } 
                elseif($display -> num_rows == 1) {
                    $row = $display -> fetch_assoc();
                    echo "<tr>  <td>".$row['event_type']."</td>
                                <td>".$row['event_name']."</td>
                                <td>".$row['event_date']."</td>
                                <td>".$row['event_time']."</td>
                                <td>".$row['team_name']."</td>
                                <td>".$row['playground']."</td>
                                <td>".$row['address']."</td>
                                <td>".$row['country']."</td>
                            </tr>";
                    }
                    else {
                        $rows = $display -> fetch_all(MYSQLI_ASSOC);
                        foreach ($rows as $key => $value) {
                        echo "<tr>  <td>".$value['event_type']."</td>
                                    <td>".$value['event_name']."</td>
                                    <td>".$value['event_date']."</td>
                                    <td>".$value['event_time']."</td>
                                    <td>".$value['team_name']."</td>
                                    <td>".$value['playground']."</td>
                                    <td>".$value['address']."</td>
                                    <td>".$value['country']."</td>
                                </tr>";
                            }
                        }
        ?>
    </tbody>  
    </table>

</main><!--End of container-->


<footer class="container fluid text-center text-danger">
<h5>John Oxales 2021</h5>
</footer>    

</body>
</html>