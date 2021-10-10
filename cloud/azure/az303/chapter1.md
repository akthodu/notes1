# Webservice







# Application insights




# Function




# SQL Database

Azure SQL Server

- here 99.99% availbility is guaranteed.
- It has features such as built in backups, patching and recovery
- Has builit-in advanced intelligence and security.
- There is no conecept of private ip addressing. you need to  manage access via firewall.
- Migration of existing sql server con be difficult.

2 purchase models.
1. DTU -- blended measure of cpu, memory and read-write access(Basic, Standard and Premium)

2. Vcore - We can independently scale compute and storage.

Compute tier
1. Vcore-based purchasing model


> general purpose Scalable compute

> Hyperscale on demand scalable storage

> Business Critical (High )

# Azure SQL server instance - Managed Instance offer



- Easy migration of existing on premise sqlserver databases.
- Provides 100% compatabilty with latest sql server on-premises enterprise database engine.
- Also provides a native virtual network implementation.

# SQL Elastic pools.

This is cost effective solution that can be used to manage multiple databases that have varying and unpredictable usage demands.

- the databases that are part of the elastic pool need to be on single server.
- these databases would share the resources.
- the resources are already allocated at a set price.
-  The scaling of the load is done automatically.
- ` there can be brief outage in order of seconds. here again at the end of the operation , the existing database connections are dropped.