#!/bin/sh
/opt/jdk1.8.0_212/bin/java -Xms2048M -Xmx2048M -Xmn500M -XX:NewRatio=4 -XX:SurvivorRatio=7 -XX:InitialSurvivorRatio=4 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=90 -XX:+UseCMSInitiatingOccupancyOnly -XX:MaxTenuringThreshold=15 -XX:+DisableExplicitGC -jar /opt/springflux-r2dbc-demo-0.0.1-SNAPSHOT.jar
