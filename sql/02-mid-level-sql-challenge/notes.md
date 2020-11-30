### Create tables
Using the `data_import_app_development` database, create the following tables in `psql`.
```
CREATE TABLE patients (
  date_of_birth date,
  given_name character varying,
  family_name character varying,
  phone_number character varying,
  sex character varying,
  provider_external_id character varying NOT NULL
);

CREATE TABLE providers (
  given_name character varying,
  family_name character varying,
  credential character varying,
  primary_specialty character varying,
  external_id character varying NOT NULL
);

CREATE TABLE laboratory_tests (
  code_type character varying,
  code_value character varying,
  result character varying,
  patient_external_id character varying NOT NULL,
  start_datetime timestamp without time zone
);

# list all the tables
data_import_app_development=# \d

# describe the patients table
data_import_app_development=# \d patients

# copy data from csv file into table
data_import_app_development=# \copy patients FROM '/Users/mdb/sql-challenge/patients.csv' DELIMITER ',' CSV
data_import_app_development=# \copy providers FROM '/Users/mdb/sql-challenge/providers.csv' DELIMITER ',' CSV
data_import_app_development=# \copy laboratory_tests FROM '/Users/mdb/sql-challenge/laboratory_tests.csv' DELIMITER ',' CSV

# list all the patients data
data_import_app_development=# select * from patients;
```

### Queries
Write a query that returns rows of all patients without a laboratory test and all laboratory tests without a patient.
```
SELECT p.given_name, p.family_name FROM patients AS p
LEFT JOIN laboratory_tests AS lt ON CONCAT(p.given_name, '-', p.family_name)=lt.patient_external_id
WHERE lt.patient_external_id IS NULL;
```


Find the number of lab tests for patients that have lab tests.
```
SELECT pa.provider_external_id, SUM((CASE WHEN lt.patient_external_id IS NOT NULL THEN 1 ELSE 0 END)) AS num_lab_tests
FROM patients AS pa
LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
GROUP BY pa.provider_external_id;
```
Note: The Using SUM() and CASE we can count only non-null values.


Write a query that returns rows of all providers that don't have a patient with at least one laboratory test.
```
SELECT pr.given_name, pr.family_name, pr.external_id FROM providers AS pr
WHERE pr.external_id IN (
  SELECT pa.provider_external_id FROM patients AS pa
  LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
  GROUP BY pa.provider_external_id
);
```


Write a query that returns rows of all providers that don't have a patient with at least two laboratory tests.
```
SELECT pa.provider_external_id, sum((case when lt.patient_external_id is not null then 1 else 0 end))
FROM patients AS pa
LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
GROUP BY pa.provider_external_id
HAVING sum((case when lt.patient_external_id is not null then 1 else 0 end)) > 2;
```


Find patients with lab tests with negative result in the last 12 months.
```
SELECT pa.given_name, pa.family_name, pa.provider_external_id, lt.result, lt.start_datetime FROM patients AS pa
LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
WHERE lt.result='negative' AND start_datetime < current_date - interval '12' month;
```


Write a query that returns rows of all providers that don't have a patient with at
least one laboratory test with a negative result in the last 365 days
```
SELECT pr.given_name, pr.family_name, pr.external_id FROM providers AS pr
WHERE pr.external_id IN (
  SELECT pa.provider_external_id FROM patients AS pa
  LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
  WHERE lt.result='negative' AND lt.start_datetime < current_date - interval '365' day
);
```


Take the query from the previous step and modify it to filter by a `result` above `7.5`
```
/* casting the result to a decimal */
SELECT CASE WHEN result ~ E'^\\d\.\\d$' THEN CAST (result AS DECIMAL) ELSE 0 END FROM laboratory_tests;

/* finding records where result is cast to a decimal and is > 7.5 */
SELECT pa.provider_external_id, lt.result FROM patients AS pa
LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
WHERE (CASE WHEN lt.result ~ E'^\\d\.\\d$' THEN CAST (lt.result AS DECIMAL) ELSE 0 END) > 7.5;
AND lt.start_datetime < current_date - interval '365' day;

SELECT pr.given_name, pr.family_name, pr.external_id FROM providers AS pr
WHERE pr.external_id IN (
  SELECT pa.provider_external_id FROM patients AS pa
  LEFT JOIN laboratory_tests AS lt ON lt.patient_external_id=CONCAT(pa.given_name, '-', pa.family_name)
  WHERE (CASE WHEN lt.result ~ E'^\\d\.\\d$' THEN CAST (lt.result AS DECIMAL) ELSE 0 END) > 7.5
  AND lt.start_datetime < current_date - interval '365' day
);
```
