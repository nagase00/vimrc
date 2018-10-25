@ECHO off
::
:: PlantUML Execute
:: 
::SET GRAPHVIZ_DOT=C:\Program Files\Graphviz2.38\bin

SET PLANTUML_JAR="C:\plantUML\plantuml.jar"

java -jar %PLANTUML_JAR%  %*