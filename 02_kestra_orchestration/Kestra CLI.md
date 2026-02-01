Kestra CLI: 

    - curl.exe -lfO -k "https://raw.githubusercontent.com/kestra-io/kestra/develop/docker-compose.yml" # Download the docker-compose.yml official file for Kestra.

    # Encode all variables from a credential file
        Get-Content .env | ForEach-Object {
        >>     if ($_ -match '^([^=]+)=(.*)$') {
        >>         $key = $matches[1]
        >>         $value = $matches[2]
        >>         $encoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($value))
        >>         "SECRET_$key=$encoded"
        >>     }
        >> } | Out-File .env_encoded


    Static RAG vs Web Search RAG: 

        Static RAG (e.g., with document ingestion) is ideal when you want to ground responses in a fixed knowledge base, such as internal documentation or policies.

        Web Search RAG extends this by retrieving fresh, dynamic content from the internet, making it better for answering time-sensitive or evolving questions like product releases or recent events.
