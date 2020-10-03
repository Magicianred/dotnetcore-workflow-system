# dotnetcore-workflow-system
Dotnet core e SqlServer implementation of [WorkflowSystem](https://github.com/Magicianred/WorkflowSystem)  

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/Magicianred/dotnetcore-workflow-system?label=version&sort=semver) ![GitHub](https://img.shields.io/github/license/Magicianred/dotnetcore-workflow-system)

Use of [sql-db-script-migration-system](https://github.com/Magicianred/sqlserver-db-script-migration-system)  

## Setup

### DB
Run:  
1. SqlScripts/000_CreateDbMigration.sql  
    to initialize sql-db-script-migration-system.sql
2. SqlScripts/000b_CreateUniqueCostraintForMigrationName.sql
3. SqlScripts/001_InitializeTables.sql  
    to create tables.


