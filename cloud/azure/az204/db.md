# Cosmos

SQL API

You can create multiple databases in cosmos DB account.

each database can have multiple collection ids.

each collectionid has partition key

**Throughput**

- Throughput is combined measured of CPU, Memory, IOPS
- It  is same across any API you choose.
-  The throughput is measured in reaquest units.
-  The cost to read a 1 kb item is 1 request unit.
-  Billing is done in hourly basis.

**Working with SQL API**
- The azure cosmos  DB SQL API allows one to query JSON documents using structured query language.
- Data is stored as documents when you use the SQL API
-  Information is collected into databases, Collections and Documents.
-  Parition key is use partiton the cosmos DB.
-  Each item in a container in a database contains an item iD.
-  The partiton key and item ID helps to create the item index which helps to uniquely identify the item.

**API**
- Core SQL - SQL API- Called Documents
- MongoDB
- Cassandra
- Azure table - Table API - Called Entities
- Gremlin

Cassandra - Column based structure.
Gremlin - Graph based structure.

SQL API. 
in a database, we have container. Container is nothing but a table.

Table API
- Partition Key and Row Key
- Partition key - property used to partition data.
- Rowkey - property used to uniquely identify data.
  


# **Create cosmos DB using Azure CLI**

> az cosmos create --g <Resource-group> -- default -consitenty-level {BoundedStaleness, ConsistentPrefix Eventual, Session,Strong} --kind {GlobalDocumentDB, MongoDB, Parse}

Ex:
```
az cosmosdb create --name <cosmosdbname> --resource-group <resourcegroup-name> --default-consistency-level Eventual --kind GlobalDocumentDB
```

# Consistency levels

Replica sets
- Strong
- Bounded Staleness
- Session
- Conistent Prfix
-  Eventual

![](2021-09-26-14-27-29.png)






