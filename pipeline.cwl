#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: v1.0

inputs:
  file1:
    type: File

outputs:
  count_output:
    type: int
    outputSource: step2/output

steps:
  step1:
    run: steps/wc-tool.cwl
    in:
      file1: file1
    out: [output]

  step2:
    run: steps/parseInt-tool.cwl
    in:
      file1: step1/output
    out: [output]
