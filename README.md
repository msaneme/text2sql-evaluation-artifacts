# Text-to-SQL Evaluation Artifacts

## Overview

This repository contains the experimental artifacts used in the evaluation of large language models (LLMs) for Text-to-SQL translation, as described in the associated IEEE Access manuscript.

The materials provided here support transparency, reproducibility, and further inspection of the experimental setup, including both the core Text-to-SQL evaluation and the preliminary validation of security-related behaviors.

A persistent DOI will be assigned via Zenodo upon release (**v1.0.0**).

---

## Repository Structure

```
.
├── prompts/
│   ├── NLQ-specific prompt instances
│   └── SECURITY-COMPLETE-PROMPTS_TEMPLATE
│
├── reference_sql/
│   └── Expert-defined reference SQL queries
│
├── schema/
│   └── Full database schema definitions
│
├── config/
│   └── LLM generation parameter configuration
│
├── licences/
│   └── Licensing information
│
└── README.md
```

---

## Prompts

### NLQ-Specific Prompts

The `prompts/` directory contains the complete prompt instances used for each of the 11 natural language queries (NLQs) evaluated in the study. Each prompt integrates:

- the natural language query,
- its expert manually defined intent transcription,
- and the database schema,

following the exact input format employed during evaluation.

A single prompt is defined per NLQ and reused across all evaluated LLMs to ensure experimental consistency and fair comparison.

### Security-Oriented Prompt Template

The file **`SECURITY-COMPLETE-PROMPTS_TEMPLATE`** provides the complete set of prompts used to support the security and authentication components of the proposed system architecture. These prompts are employed in the *Preliminary Security Behavior Validation* described in the evaluation chapter of the manuscript.

They include system-level instructions related to security and access control, authentication and authorization constraints, and prompt structures designed to validate whether generated SQL adheres to predefined security requirements.

---

## Reference SQL Queries

The `reference_sql/` directory contains the expert-authored SQL queries corresponding to each NLQ. These queries serve as ground truth for computing:

- Execution Accuracy (EX)
- Valid Efficiency Score (VES)

A generated SQL query is considered correct only if it produces the same result set as its corresponding reference query.

---

## Database Schema

The `schema/` directory includes the full relational schema used in the experiments, including table definitions and relationships. No database records or sensitive data are included.

---

## Generation Parameters

The `config/` directory contains the LLM generation parameters shared across all evaluated models:

- `temperature = 0.0`
- `top_p = 1.0`
- `max_tokens = 512`
- `frequency_penalty = 0.0`
- `presence_penalty = 0.0`

No random seed was fixed during inference, as not all evaluated APIs expose this parameter consistently.

---

## Experimental Notes

- The evaluation considers 11 NLQs.
- Each NLQ is translated into SQL 10 times per model.
- Identical prompts and generation parameters are used across all evaluated LLMs.
- Semantic correctness is assessed via execution-based validation against expert-defined SQL queries.
- Security-related behaviors are evaluated separately using the security-complete prompt template.

Further experimental details can be found in the associated manuscript.

---

## License

This repository includes multiple licenses governing different components of the provided materials. Please refer to the `licences/` directory for detailed licensing information.

---

## Citation

If you use this repository in your research, please cite the associated IEEE Access article and the Zenodo release (DOI to be added upon publication).
