<?php

/**
 * *    *    *    *    *
-    -    -    -    -
|    |    |    |    |
|    |    |    |    |
|    |    |    |    +----- day of week (0 - 7) (Sunday=0 or 7)
|    |    |    +---------- month (1 - 12)
|    |    +--------------- day of month (1 - 31)
|    +-------------------- hour (0 - 23)
+------------------------- min (0 - 59)
 */

require_once "../../vendor/autoload.php";
date_default_timezone_set("America/Lima");

use Cron\CronExpression;

$cron = new CronExpression("0 0 * * *");

$today = date("Y-m-d h:i:s");

$cronDay = $cron->getNextRunDate()->format("Y-m-d h:i:s");


if($today !== $cronDay){
    echo "los dias son distintos \n";
    echo $today . "\n";
    echo $cronDay . "\n";
}else{
    echo "los dias son iguales \n";
    echo $today . "\n";
    echo $cronDay . "\n";
}
?>