# Translized download docker action

Download your localization files from [Translized](https://www.translized.com/) translation management platform. 
For detailed documentation of Translized CLI, please [visit the documentation](https://docs.translized.com/docs/cli/basics/).

# Prerequisites

Configuration file **.translized.yml** should exist in a root directory.
More details about file and how to create it can be found [here](https://docs.translized.com/docs/cli/configuration).

# Example usage

    name: upload_translized
    on:
      push:
        tags:
        - '*'

    jobs:
      upload:
        runs-on: ubuntu-latest
        steps:
          - name: Copy repository
            uses: actions/checkout@v4

          - name: Translized download
            uses: translized/download@v1.0

          - name: Create Pull Request
            uses: peter-evans/create-pull-request@v5
            with:
              commit-message: Update translation files
              committer: GitHub <noreply@github.com>
              author: ${{ github.actor }} <${{ github.actor }}@users.noreply.github.com>
              title: 'Update translation files'
              body: |
                Updated translation files from translized.
                Link: https://app.translized.com/project/uirdZQ5gPR/languages

This job will download your latest localization files from Translized whenever you push new tag, and pull request with the new files is created.