{{/*
Deployment - Repository
*/}}
{{- define "browse-executor.image.service.repository" -}}
{{- coalesce $.Values.image.service.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "browse-executor.image.service.tag" -}}
{{- coalesce $.Values.image.service.tag "latest" -}}
{{- end -}}

{{/*
Deployment - useKubeEnvironment
*/}}
{{- define "browse-executor.useKubeEnvironment" -}}
{{- coalesce $.Values.useKubeEnvironment $.Values.global.useKubeEnvironment 1 -}}
{{- end -}}
