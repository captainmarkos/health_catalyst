pg_dump -t 'multispecialty.providers' \
       -t 'multispecialty.patients' \
       -h localhost.aptible.in \
       -p 62217 \
       -U aptible -d db \
       --no-owner \
       > patients_and_providers_dump.sql
