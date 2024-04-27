#!/usr/bin/env nextflow
/*
See the NOTICE file distributed with this work for additional information
regarding copyright ownership.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

process BUSCO_DATASET {

    label 'python'
    tag "$taxon_id:$core"

    input:
    tuple val(gca), val(taxon_id), val(core)

    output:
    stdout emit: dataset
    tuple val(gca), val(core), emit: db
    
    println(["GCA: gca, Taxon ID: taxon_id, Core name: core"])
    script:
    """
    clade_selector.py -d ${params.busco_datasets} -t ${taxon_id}
    """
    // the script needs to be stored in the bin dir in the workflow dir
    
}



