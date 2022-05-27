#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.greetings = ['Bonjour', 'Ciao', 'Hello', 'Hola']
process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of(params.greetings).flatten() | sayHello | view
}
