#!/bin/bash

set -euf

PROJECT_SLUG='gh/banzaicloud/banzaicloud.github.io'

function main()
{
    curl \
        -u "${CIRCLE_TOKEN}:" \
        -X POST \
        --header "Content-Type: application/json" \
        -d "{
            \"branch\": \"gh-pages\",
            \"parameters\": {
                \"remote-trigger\": true,
                \"module\": \"thanos-operator\"
            }
        }" "https://circleci.com/api/v2/project/${PROJECT_SLUG}/pipeline"
}

main "$@"
