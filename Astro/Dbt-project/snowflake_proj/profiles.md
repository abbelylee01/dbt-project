Mark_s:
  outputs:
    dev: 
      account: cuk-cuk_dev
      authenticator: externalbrowser
      client_session_keep_alive: false
      database: dev
      query_tag: dbt
      role: marksabin__u_role
      schema: obr
      threads: 4
      type: snowflake
      user: mark.sabin@carnivalukgroup.com
      warehouse: cluster_wh
  target: dev

Adobe_Martech:
  outputs:
    dev:
      account: cuk-cuk_dev
      authenticator: externalbrowser
      client_session_keep_alive: false
      database: dev
      query_tag: dbt
      role: abiodunadeoye__u_role
      schema: stg_martech
      threads: 4
      type: snowflake
      user: abiodun.adeoye@carnivalukgroup.com
      warehouse: cluster_wh
  target: dev
