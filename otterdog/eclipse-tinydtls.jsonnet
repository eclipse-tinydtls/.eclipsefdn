local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.tinydtls', 'eclipse-tinydtls') {
  settings+: {
    description: "",
    name: "Eclipse tinydtls",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/tinydtls/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('tinydtls') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "c-cpp"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse tinydtls",
      homepage: "https://projects.eclipse.org/projects/iot.tinydtls",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
}
