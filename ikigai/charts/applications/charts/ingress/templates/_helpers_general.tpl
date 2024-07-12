{{/*
Deployment - Repository
*/}}
{{- define "ingress.image.nginx.repository" -}}
{{- coalesce $.Values.image.nginx.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "ingress.image.nginx.tag" -}}
{{- coalesce $.Values.image.nginx.tag "latest" -}}
{{- end -}}