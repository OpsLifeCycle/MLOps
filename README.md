# MLOps Lifecycle Management

Welcome to the **MLOps Lifecycle Management** repository! This project offers a structured framework for managing the entire lifecycle of machine learning operations (MLOps) in cloud-agnostic environments. By combining modular infrastructure, robust workflows, and automation-ready templates, it simplifies the orchestration of machine learning projects, making them efficient, scalable, and secure.

---

## 🚀 What is MLOps?

MLOps (Machine Learning Operations) is a set of practices that bring DevOps principles into machine learning, focusing on:
- **Standardization** of workflows.
- **Automation** of repetitive tasks like training and deployment.
- **Collaboration** between data scientists, developers, and infrastructure engineers.
- **Continuous integration and delivery (CI/CD)** of machine learning models.

The end result is a seamless process for developing, deploying, and maintaining ML models at scale with faster time-to-market, reduced operational burden, and stringent governance.

---

## ✅ Project Overview

This repository enables organizations of all sizes to operationalize their machine learning projects efficiently. It delivers modular solutions to support cloud-based infrastructure management, workflows for managing data pipelines, and automation tools for training and deployment.

### Supported Project Types:
1. **Classical ML**: For tasks like regression, classification, and clustering.
2. **Computer Vision (CV)**: For image classification, object detection, and other vision-based projects.
3. **Natural Language Processing (NLP)**: For text summarization, sentiment analysis, translation, and similar workflows.

### Built-in Integrations:
- **Cloud Provider:** Azure (default) for provisioning infrastructure.
- **Orchestration Tools:** GitHub Actions for CI/CD pipelines.
- **Infrastructure as Code (IaC):** Terraform for managing infrastructure modules.

---

## 💡 Key Features

### 🔨 **Template-Based Automation**:
Pre-configured templates are included for setting up repositories, provisioning cloud resources, creating pipelines, and monitoring workflows. These templates abstract complexity and reduce setup time.

### 🌐 **Cloud-Agnostic Design**:
While Azure is the default provider, the repository can be adapted with Terraform modules to support other environments such as AWS or Google Cloud.

### 🛠️ **Modular Infrastructure**:
The repository organizes infrastructure into distinct modules (e.g., resource groups, storage accounts, compute clusters), offering flexibility to mix and match based on project requirements.

### 🔒 **Security-first Approach**:
- Out-of-the-box integration with **Azure Key Vault** for securely managing secrets.
- Dynamic secret and token injection into workflows via **GitHub Secrets**.

### 📈 **Scalability**:
Built to manage large-scale ML models for both development (dev) and production (prod) environments. The infrastructure scales with the increasing complexity of ML workloads.

### 📋 **Unit Testing and CI/CD**:
- Integrated testing workflows using Flake8, PyLint, and PyTest.
- GitHub Actions pipelines for CI/CD processes, including model deployment and monitoring.

---

## 📂 Project Folder Structure

Here’s an overview of the folder structure to help you navigate this repository:

### 🌟 Workflow and Orchestration
- **`.github/workflows/`**: GitHub Actions workflows for tasks such as repository initialization, infrastructure provisioning, compute setup, training, and deployment.
- **`templates/project/`**: Workflow templates organized by project type (`classical`, `cv`, `nlp`).

### 🏗️ Infrastructure
- **`templates/mlops/azure/`**: Infrastructure templates for Azure environments, including resource groups, Azure Machine Learning (AML) services, compute clusters, and more.
- **`templates/mlops/terraform/`**: Terraform modules for provisioning and managing cloud infrastructure.

### 🤖 Machine Learning Pipelines
- **`azure/mlops/azureml`**: Configuration files for defining, running, and managing Azure ML pipelines (jobs, tasks, component definitions).

### ⚙️ Testing
- **`templates/mlops/tests/`**: Scripts and workflows for running unit tests with tools like Flake8 and PyTest to maintain code quality.

---

## ⚡ Quick Start Guide

### Prerequisites

Before setting up, ensure that you meet the following prerequisites:

#### **Cloud Account**:
- Azure subscription or another supported cloud provider account.

#### **Tools Installation**:
- **Azure CLI**: For managing Azure resources.
- **Terraform**: For deploying infrastructure as code.
- **GitHub CLI**: For managing GitHub repositories and secrets.

#### **GitHub Secrets**:
Secrets are required to enable automation workflows properly:
- `ARM_CLIENT_ID`: Azure authentication client ID.
- `ARM_CLIENT_SECRET`: Azure client secret.
- `ARM_SUBSCRIPTION_ID`: Azure subscription identifier.
- `ARM_TENANT_ID`: Azure tenant identifier.
- `ORGANISATION_PERSONAL_ACCESS_TOKEN`: Personal access token (PAT) for GitHub organization with the following permissions:
  - Repository Access: All repositories
  - Permissions: Administration, Contents, Secrets, Workflows (Read/Write)
- `TEMPLATE_PERSONAL_ACCESS_TOKEN`: GitHub PAT for parent/template repository with permissions:
  - Repository Access: Selected repositories
  - Permissions: Contents and Metadata (Read).

#### **Development Environment**:
Ensure the appropriate Python version is installed:
- **Python Version**: 3.7 or higher.
- Install dependencies via `train-requirements.txt`.

---

### Steps to Initialize a New Project

1. **Run Initialization Workflow**:
   Trigger the `00-Initialize-Repository` GitHub workflow with the following inputs:
   - `github_org_name`: GitHub organization/personal account name.
   - `repo_name`: Name for the new repository.
   - `project_type`: Choose between `classical`, `cv`, or `nlp`.
   - `infrastructure_provider`: Default is `azure`.
   - `orchestration_tool`: Default is `github`.

   **Outcome**: Generates a new project structure with necessary templates.

2. **Provision Infrastructure**:
   Deploy infrastructure using the `gh-deploy-infra.yml` workflow. Terraform provisions resources such as resource groups, Azure Machine Learning workspaces, and storage accounts.

3. **Configure Training and Deployment**:
   Use ML workflows to perform key operations:
   - Set up compute clusters with `train-create-compute-pipeline.yml`.
   - Trigger build environments using `train-create-environment-pipeline.yml`.
   - Run `train-create-dataset-pipeline.yml` to trigger dataset creation.
   - Run training pipelines with `train-run-ml-pipeline.yml`.
   - Run `deploy-create-online-endpoint-pipeline.yml` and/or `deploy-create-batch-endpoint-pipeline.yml` to trigger online and batch managed endpoint creation.
   - Deploy models for online or batch inference using deployment pipelines like `deploy-create-online-deployment-pipeline.yml` and/or `deploy-create-batch-deployment-pipeline.yml`.

4. **Test and Validate**:
   Run unit tests using the `templates/mlops/tests/unit-tests.yml` workflow to validate infrastructure, training pipelines, and deployed models.

---

## 🤝 Contributing

We ❤️ contributions! Whether you’re fixing bugs, improving documentation, or suggesting new features, we encourage active participation. 

### Contribution Process:
1. Review the project's [CONTRIBUTING.md](CONTRIBUTING.md).
2. Submit an issue or feature request for discussion.
3. Create a pull request with detailed explanations and test coverage.

For more details, check the contribution guide.

---

## 📜 Licensing

This project is licensed under the **[PolyForm Strict License 1.0.0](LICENSE.md)**. Ensure you understand and comply with the terms before using or contributing to this repository.

For full terms, refer to the LICENSE.md file.

---

## ❤️ Gratitude

We hope this repository simplifies your MLOps workflows and accelerates your journey toward operational excellence. For any questions or feedback, check out the [Discussions](https://github.com/OpsLifeCycle/mlops/discussions) or [CONTRIBUTING.md](CONTRIBUTING.md).

Feel free to explore, contribute, and grow 🚀!