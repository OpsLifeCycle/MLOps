# MLOps Lifecycle Management

Welcome to the MLOps Lifecycle Management repository! This project provides a structured approach for managing MLOps workflows in cloud-agnostic environments, enabling organizations to orchestrate machine learning operations efficiently and effectively.

## What is MLOps?

MLOps (Machine Learning Operations) refers to the practice of applying DevOps principles to machine learning projects. It focuses on standardizing, automating, and improving the lifecycle of machine learning models—covering stages like development, deployment, monitoring, and continuous integration/delivery.

## Project Overview

The MLOps Lifecycle Management repository delivers a comprehensive and modular solution for managing cloud-based machine learning infrastructure. It supports multiple project types, including:

- **Classical**: Standard machine learning workflows.
- **CV (Computer Vision)**: Workflows for image classification, object detection, and other vision-based tasks.
- **NLP (Natural Language Processing)**: Workflows for text summarization, sentiment analysis, and related language tasks.

This solution is designed to integrate seamlessly with tools such as Azure, Terraform, and GitHub Actions for end-to-end orchestration in different environments.

## Key Features

- **Template-Based Automation**: Pre-built templates for deployment, compute clusters, pipelines, and other resources.
- **Cloud Agnostic**: Compatibility with Azure and can be adapted to other cloud providers using Terraform modules.
- **Modularity**: Separate modules for infrastructure (e.g., Azure Machine Learning, Resource Groups, Storage Accounts) and workflows (e.g., training pipelines, deployment configurations).
- **Security and Governance**: Includes integration with Azure Key Vault and GitHub secrets for secure configurations.
- **Scalability**: Designed to handle large-scale machine learning projects with support for multiple environments (dev and prod).

## Supported Tools and Platforms

- **Cloud Provider**: Azure (default)
- **Infrastructure as Code**: Terraform
- **Orchestration Tools**: GitHub Actions
- **Pre-defined Templates**: Pipelines for training, deployment, and monitoring.

## Project Folder Structure

### Workflow and Orchestration
- `.github/workflows/`: GitHub Actions workflows for initializing the repository, running ML pipelines, and deploying infrastructure.
- `templates/project/`: Predefined project templates categorized by type: `classical`, `cv`, and `nlp`.

### Infrastructure
- `templates/mlops/azure/`: Templates for Azure-based infrastructure provisioning, such as resource groups, AML workspaces, storage, and compute.
- `templates/mlops/terraform/`: Terraform modules for defining and managing cloud infrastructure.

### Machine Learning Pipelines
- `azure/mlops/azureml`: Configuration files for Azure Machine Learning pipelines, component definitions, and environment registration.

### Testing
- `templates/mlops/tests/`: Unit testing scripts with Flake8, PyLint, and PyTest integration.

## Quick Start

### Prerequisites

To get started, ensure you have the following setup:

1. **Cloud Subscription**:
   - An account with Azure or other supported cloud providers.

2. **Environment Setup**:
   Install the following dependencies on your local machine:
   - **Azure CLI**
   - **Terraform** (for infrastructure provisioning)
   - **GitHub CLI** (for repository and secret management)

3. **Required Secrets**:
   Include the following secrets in your project to facilitate smooth environment configuration:

   - `ARM_CLIENT_ID`: Required for Azure authentication.
   - `ARM_CLIENT_SECRET`: Required for Azure authentication.
   - `ARM_SUBSCRIPTION_ID`: Azure subscription identifier.
   - `ARM_TENANT_ID`: Azure tenant identifier.
   - `ORGANISATION_PERSONAL_ACCESS_TOKEN`: GitHub PAT of target GitHub organization or perssonal account, where child repositories will be created. used for repository management and secret setup..
      - Repository access : All repositories
      - Repository permissions
         - Administration : Read and Write
         - Contents: Read and Write
         - Secrets: Read and Write
         - Workflows: Read and Write
         - Metadata : Read
   - `TEMPLATE_PERSONAL_ACCESS_TOKEN`: GitHub PAT of current GitHub organization or perssonal account where parent/template repository is located, used for read-only access to enable smooth integration of child repositories with parent/template repositories.
      - Repository access : Only select repositories (your template repository)
      - Repository permissions
         - Contents: Read
         - Metadata : Read
   
4. **Python Development Environment**:
   - **Python Version**: Python 3.7 or higher.
   - **Dependencies**: Install required dependencies specified in `train-requirements.txt`.
### Steps to Initialize a New Project

1. **Run the Initialization Workflow**:
   Use the `00-Initialize-Repository` workflow to initialize a new project repository.
   Required inputs:
   - `github_org_name`: username of the GitHub organization or personal account .
   - `repo_name`: Name of the repository to be created.
   - `project_type`: Choose between `classical`, `cv`, or `nlp`.
   - `infrastructure_provider`: Default is `azure`.
   - `orchestration_tool`: Default is `github`.

   The workflow will create the necessary folder structure and add template files.

2. **Provision Infrastructure**:
   Use the `gh-deploy-infra.yml` workflow to provision cloud infrastructure using Terraform.

3. **Create Compute, Environment, Train and Deploy Models**:
  - Use `train-create-compute-pipeline.yml` to create compute clusters (CPU/GPU nodes).
  - Use `train-create-environment-pipeline.yml` to trigger environment-setup.
  - use `train-create-dataset-pipeline.yml` to trigger dataset creation.
  - Use `train-run-ml-pipeline.yml` to trigger training.
  - Use `deploy-create-online-endpoint-pipeline.yml` and `deploy-create-batch-endpoint-pipeline.yml` to trigger online and batch managed endpoint creation.
   - Use `deploy-create-online-endpoint-pipeline.yml` and/or `deploy-create-batch-endpoint-pipeline.yml` to trigger online and batch managed endpoint creation.
   - Use `deploy-create-online-deployment-pipeline.yml` and/or `deploy-create-batch-deployment-pipeline.yml` to trigger Model deployment for Managed online and batch endpoints.

4. **Test and Validate**:
   Run unit tests using workflows in `templates/mlops/tests/unit-tests.yml`.

## Contributing

We welcome contributions to improve and extend this repository! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to report issues, suggest new features, and submit pull requests.

## Licensing

This project is distributed under the [PolyForm Strict License 1.0.0](LICENSE.md). Please ensure compliance with licensing terms before contributing to or using the repository.

---

We hope this repository simplifies your MLOps journey. Feel free to explore the provided workflows.