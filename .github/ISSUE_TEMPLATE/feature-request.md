---
name: Request or suggest a new feature.
about: Have an idea for a new feature?
title: '[new feature] <title>'
labels: ['New Feature', 'Needs Triage']
assignees: ''
---

body:
- type: textarea
  attributes:
    label: Problem Statement
    description: |
      Clearly describe the problem you're trying to solve. What's the current pain point, and why is a new feature needed?

    validations:
      required: true

- type: textarea
  attributes:
    label: Solution Overview
    description: |
      Provide a concise overview of your proposed feature. What are its key features, benefits, and how does it address the problem statement?

    validations:
      required: true

- type: textarea
  attributes:
    label: Technical Requirements
    description: |
      Outline the technical requirements for implementing this new feature. Include any necessary infrastructure or MLOps work.

    validations:
      required: true

- type: checkboxlist
  attributes:
    label: Additional Context
    description: |
      If applicable, provide any additional context that might be helpful in understanding your request.

  options:
    - "Links to relevant documentation or research"
    - "References to similar projects or solutions"
    - "Other (please specify)"

- type: checkboxlist
  attributes:
    label: How Does This Fit into Our Current Solution?
    description: |
      Indicate how this new feature aligns with our existing prduct roadmap and goals.

  options:
    - "Complements existing features"
    - "Replaces or reduces the need for existing features"
    - "Introduces a new use case or workflow"

- type: checkboxlist
  attributes:
    label: What's Next?
    description: |
      Indicate what you're willing to do next in terms of implementation, testing, or collaboration.

  options:
    - "I'm happy to implement this feature myself"
    - "I'd like to collaborate with the team on implementation"
    - "I'd like to discuss further and gather feedback before proceeding"
