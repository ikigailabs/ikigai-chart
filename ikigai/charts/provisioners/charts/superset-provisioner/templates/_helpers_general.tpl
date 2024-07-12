{{/*
Deployment - Repository
*/}}
{{- define "superset-provisioner.image.service.repository" -}}
{{- coalesce $.Values.image.service.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "superset-provisioner.image.service.tag" -}}
{{- coalesce $.Values.image.service.tag "latest" -}}
{{- end -}}

{{/*
Deployment - useKubeEnvironment
*/}}
{{- define "superset-provisioner.useKubeEnvironment" -}}
{{- coalesce $.Values.useKubeEnvironment $.Values.global.useKubeEnvironment 1 -}}
{{- end -}}
