# make spark-code

default: all

all: spark examples

spark: build/spark.js
examples: example.html

build/spark.js: src/spark.coffee
	coffee -c -o build src/spark.coffee

example.html: src/example.haml
	haml src/example.haml > example.html
