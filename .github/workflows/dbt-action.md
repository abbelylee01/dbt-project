name: Test DBT Project
on: [push, workflow_dispatch]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Get the code from github to runner
        uses: actions/checkout@v4

      - name: Install Python
        uses: actions/setup-python@v5
        with:
            python-version: 3.13.1

      - name: Install dbt
        run: |
          python -m pip install --upgrade pip
          pip install -r ./Dbt-project/requirements.txt

      - name: Configure dbt Profile
        run: |
          mkdir -p ~/.dbt
          echo "snowflake_proj:" > ~/.dbt/profiles.yml
          echo "  outputs:" >> ~/.dbt/profiles.yml
          echo "    dev:" >> ~/.dbt/profiles.yml
          echo "      account: ws79766.eu-west-2.aws" >> ~/.dbt/profiles.yml
          echo "      database: DEV" >> ~/.dbt/profiles.yml
          echo "      password: Ibidapo22!" >> ~/.dbt/profiles.yml
          echo "      role: ACCOUNTADMIN" >> ~/.dbt/profiles.yml
          echo "      schema: PUBLIC" >> ~/.dbt/profiles.yml
          echo "      threads: 1" >> ~/.dbt/profiles.yml
          echo "      type: snowflake" >> ~/.dbt/profiles.yml
          echo "      user: moray" >> ~/.dbt/profiles.yml
          echo "      warehouse: COMPUTE_WH" >> ~/.dbt/profiles.yml
          echo "  target: dev" >> ~/.dbt/profiles.yml

      # Step 5: Run SQLFluff Linter
      - name: Run Linter
        run: sqlfluff lint ./Dbt-project/snowflake_proj
  
        # Step 5: Install dbt Dependencies
      - name: Install dbt Dependencies
        working-directory: ./Dbt-project/snowflake_proj
        run: dbt deps

      # Step 6: Debug dbt Environment
      - name: Debug dbt Environment
        working-directory: ./Dbt-project/snowflake_proj
        run: dbt debug

      # Step 7: Run dbt Models
      - name: Run dbt Models
        working-directory: ./Dbt-project/snowflake_proj
        run: dbt run