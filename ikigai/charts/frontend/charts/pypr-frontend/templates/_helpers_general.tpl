{{/*
Deployment - Repository
*/}}
{{- define "pypr-frontend.image.service.repository" -}}
{{- coalesce $.Values.image.service.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "pypr-frontend.image.service.tag" -}}
{{- coalesce $.Values.image.service.tag "latest" -}}
{{- end -}}
