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
    """
}

process writeReport {
  publishDir '.'

  output:
    path("customReport.html")
    
  script:
    """
    cat <<EOF > customReport.html
<html>
<h1>This is a Custom Report</h1>
<table>
<body>
<tr><th>foo</th></tr>
<tr><td>bar</td></tr>
</table>
</body>
</html>
EOF
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
  writeReport()
}
