### dbt integration test suite for dbt-utils-sqlserver

This directory contains an example dbt project which tests the macros in the `dbt-utils-sqlserver` package. An integration test typically involves making 1) a new seed file 2) a new model file 3) a schema test.

For an example integration tests, check out the tests for the `get_url_parameter` macro:

1. [Macro definition](https://github.com/fishtown-analytics/dbt-utils/blob/master/macros/web/get_url_parameter.sql)
2. [Seed file with fake data](https://github.com/fishtown-analytics/dbt-utils/blob/master/integration_tests/data/web/data_urls.csv)
3. [Model to test the macro](https://github.com/fishtown-analytics/dbt-utils/blob/master/integration_tests/models/web/test_urls.sql)
4. [A schema test to assert the macro works as expected](https://github.com/fishtown-analytics/dbt-utils/blob/master/integration_tests/models/web/schema.yml#L2)


Once you've added all of these files, you should be able to run:
```
$ dbt seed
$ dbt run --model {your_model_name}
$ dbt test --model {your_model_name}
```

As of current version of dbt. Data tests are not supported on sql server. If you realy want to test the failing data tests, use [my fork of dbt](https://github.com/mikaelene/dbt/blob/project_cols_data_test/core/dbt/compilation.py)
