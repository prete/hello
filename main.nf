#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout

  script:
    """
    echo '$x world!'
    echo '$x world!' >> custom_report.html
    """
}

process publishReport {
  publishDir '/tmp'

  output:
    path("customReport.html")

  script:
    """
    echo '<html><body><h1>this is a custom report</h1></body></html>' >> customReport.html
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
  publishReport()
}
