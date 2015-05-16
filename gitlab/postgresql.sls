include:
  - postgres

gitlab-db:
  postgres_user.present:
    - name: {{ salt['pillar.get']('gitlab:db_user') }}
    - password: {{ salt['pillar.get']('gitlab:db_pass') }}
    - require:
      - pkg: install-postgresql
      - service: run-postgresql
  postgres_database.present:
    - name: {{ salt['pillar.get']('gitlab:db_name') }}
    - owner: {{ salt['pillar.get']('gitlab:db_user') }}
    - template: template1
    - require:
      - file: gitlab-service
      - pkg: install-postgresql
      - service: run-postgresql
      - postgres_user: gitlab-db
