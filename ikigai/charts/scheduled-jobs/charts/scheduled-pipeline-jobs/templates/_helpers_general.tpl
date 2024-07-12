{{/*
Deployment - Repository
*/}}
{{- define "scheduled-pipeline-jobs.image.jobs.repository" -}}
{{- coalesce $.Values.image.jobs.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - useKubeEnvironment
*/}}
{{- define "scheduled-pipeline-jobs.useKubeEnvironment" -}}
{{- coalesce $.Values.useKubeEnvironment $.Values.global.useKubeEnvironment 1 -}}
{{- end -}}
