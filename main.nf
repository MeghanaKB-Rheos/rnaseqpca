#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/rnaseqpca
========================================================================================
    Github : https://github.com/nf-core/rnaseqpca
    Website: https://nf-co.re/rnaseqpca
    Slack  : https://nfcore.slack.com/channels/rnaseqpca
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { RNASEQPCA } from './workflows/rnaseqpca'

//
// WORKFLOW: Run main nf-core/rnaseqpca analysis pipeline
//
workflow NFCORE_RNASEQPCA {
    RNASEQPCA ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_RNASEQPCA ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
