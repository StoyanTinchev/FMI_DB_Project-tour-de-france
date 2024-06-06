# Tour de France Database Project

[<img src="https://run.pstmn.io/button.svg" alt="Run In Postman" style="width: 128px; height: 32px;">](https://app.getpostman.com/run-collection/18232984-897411de-295c-43ad-a9bd-dba0c7265bfb?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D18232984-897411de-295c-43ad-a9bd-dba0c7265bfb%26entityType%3Dcollection%26workspaceId%3D88307bb5-6f2e-4592-92ba-2ee82e613e21)

## Table of Contents:
1. [Model Scope and Task Definition](#model-scope-and-task-definition)
2. [Entities and Their Attributes](#entities-and-their-attributes)
3. [Attribute Domains](#attribute-domains)
4. [Relationships](#relationships)
5. [Constraints](#constraints)
6. [Rules and Checks](#rules-and-checks)
7. [Sources](#sources)

## Model Scope and Task Definition
The Tour de France database aims to provide a means for analyzing and tracking one of the most famous cycling competitions in the world. The project focuses on creating an information system that encompasses data about participants, teams, stages, and race results.

The database will include information on all stages of the race, including routes and lengths. Additionally, it will provide data on all cyclists who have participated in the race, such as personal information, nationality, and achieved results. Teams will also be represented in the database, with information about their composition and the country they represent.

An essential part of the project is the development of a result tracking system that allows for analyzing individual and team performances during each stage and in the overall standings. This system will enable comparisons between different cyclists and teams.

A user-friendly interface will be developed to review the data and visualize the race's progress, following standard practices.

## Entities and Their Attributes
- **Stages**: stage number, date, start point, end point, length
- **Cyclists**: registration number, name, nationality, date of birth
- **Teams**: registration number, team name, country
- **Results**: stage number
    - **Individual Results**: cyclist registration number, stage time, total time, stage ranking
    - **Team Results**: team registration number, team stage time (sum of the three best cyclists' times in the stage), total team time, stage ranking

## Attribute Domains
- **Stages**: stage number (integer), date (date), start point (string), end point (string), length (float)
- **Cyclists**: registration number (string), name (string), nationality (string), date of birth (date)
- **Teams**: registration number (string), team name (string), country (string)
- **Results**: stage number (integer)
    - **Individual Results**: cyclist registration number (string), stage time (time), total time (time), stage ranking (integer)
    - **Team Results**: team registration number (string), team stage time (time), total team time (time), stage ranking (integer)

## Relationships
- A stage involves multiple cyclists, and each cyclist participates in multiple stages.
- Each cyclist is part of exactly one team, while a team consists of multiple cyclists.
- Individual Results and Team Results are linked to Cyclists, Teams, and Stages. For each stage and cyclist, a unique individual result is recorded, and for teams, the total time and stage ranking are recorded.

## Constraints
- **Stages**: stage number uniquely identifies the stage.
- **Cyclists**: registration number uniquely identifies the cyclist.
- **Teams**: registration number uniquely identifies the team.
- **Results**:
    - **Individual Results**: the combination of cyclist registration number and stage number uniquely identifies the result.
    - **Team Results**: the combination of team registration number and stage number uniquely identifies the result.

## Rules and Checks
- **Results** (for both individual and team): Validate the stage time and total time. Times cannot be negative.
- **Cyclists**: The age of cyclists must be between 18 and 65 years inclusive.
- **Stages**: The length of the stages must be a positive number.

## Sources
- Official Tour de France website: [http://www.letour.fr](http://www.letour.fr)
- International Cycling Union (UCI): [http://www.uci.ch](http://www.uci.ch)
