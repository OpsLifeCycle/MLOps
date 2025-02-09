---
name: Suggest an enhancement or report a bug for this repository.
description: Create a report to help us reprduce and correct the issue at hand, or have an idea for improvements to this repository?
labels: ['Bug', 'Needs Triage']
assignees: ''
---

body:
- type: markdown
  attributes:
    value: >
      #### Before submitting a bug or an issue, please make sure the issue hasn't been already addressed by searching through [the past issues](https://github.com/OpsLifeCycle/mlops/issues).
- type: textarea
  attributes:
    label: Describe the issue that you are facing (bug report) or suggest an enhancement for this repository.
    description: >
      A clear and concise description of what the issue is, or a detailed explanation of the enhancement you would like to see implemented.
  validations:
    required: true
- type: textarea
  attributes:
    label: Steps/Code to Reprduce (bug report only)
    description: |
      Please add the steps required for us to reprduce the issue. We acknowledge that some of the information cannot be shared, but it really helps us to quickly
      identify the issue, able to reprduce the issue/bug/problem, and help analyze the root cause.
    placeholder: |
      ```
      Sample steps to reprduce the problem.
      ```
  validations:
    required: true
- type: textarea
  attributes:
    label: Expected Output (bug report only)
    description: >
      Please paste or describe the expected output. Explanation with a screenshot will be helpful.
    placeholder: >
      Example: No error is thrown.
  validations:
    required: true
- type: textarea
  attributes:
    label: Versions
    description: |
      Azure DevOps or GitHub Actions. Which release are you using? Are you working off the main branch of our repository?
      Bicep or Terraform
      Azure ML CLI or Azure ML SDK. Please add the version that you are using
      Examples: Pre built examples from Tabular, Computer Vision (CV), Natural Language Processing (NLP), or your own example
  validations:
    required: true
- type: dropdown
  id: MLOps_Platform
  attributes:
    label: Which platform are you using for deploying your infrastructure?
    options:
      - Azure DevOps (ADO)
      - GitHub Actions (GitHub)
      - Others
  validations:
    required: true
- type: textarea
  attributes:
    label: If you mentioned Others, please mention which platformm are you using?
- type: dropdown
  id: Infrastructure_as_Code_IaC
  attributes:
    label: What are you using for deploying your infrastructure?
    options:
      - Bicep
      - Terraform
      - Pre-Deployed
  validations:
    required: true
- type: dropdown
  id: CLISDK
  attributes:
    label: Are you using Azure ML CLI v2 or Azure ML Python SDK v2
    options:
      - Azure ML CLI v2
      - Azure ML Python SDK v2
  validations:
    required: true
- type: textarea
  attributes:
    label: Describe the example that you are trying to run?
    description: |
      Examples: Pre built examples from Tabular, Computer Vision (CV), Natural Language Processing (NLP), or your own example
  validations:
    required: true
- type: markdown
  attributes:
    value: >
      Thank you 👍!