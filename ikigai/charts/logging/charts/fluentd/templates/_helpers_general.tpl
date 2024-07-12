{{/*
Deployment - Repository
*/}}
{{- define "fluentd.image.fluentd.repository" -}}
{{- coalesce $.Values.image.fluentd.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "fluentd.image.fluentd.tag" -}}
{{- coalesce $.Values.image.fluentd.tag "latest" -}}
{{- end -}}
