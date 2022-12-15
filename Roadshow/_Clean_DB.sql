-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DECLARE @dropFKConstraints NVARCHAR(MAX) = N'';

SELECT @dropFKConstraints  += N'
ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))
    + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
    ' DROP CONSTRAINT ' + QUOTENAME(name) + ';'
FROM sys.foreign_keys;
EXEC sp_executesql @dropFKConstraints 

DECLARE @dropPKConstraints NVARCHAR(MAX) = N'';

SELECT @dropPKConstraints  += N'
ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))
    + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
    ' DROP CONSTRAINT ' + QUOTENAME(name) + ';'
FROM sys.key_constraints;
EXEC sp_executesql @dropPKConstraints 


DROP TABLE IF EXISTS [RS_Bestellung];
DROP TABLE IF EXISTS [RS_Bestellung_1];
DROP TABLE IF EXISTS [RS_Bestellung_2];
DROP TABLE IF EXISTS [RS_Bestellung_3];
