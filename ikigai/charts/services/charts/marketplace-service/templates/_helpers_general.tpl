{{/*
Deployment - Repository
*/}}
{{- define "marketplace-service.image.service.repository" -}}
{{- coalesce $.Values.image.service.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Repository
*/}}
{{- define "marketplace-service.image.gateway.repository" -}}
{{- coalesce $.Values.image.gateway.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "marketplace-service.image.service.tag" -}}
{{- coalesce $.Values.image.service.tag "latest" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "marketplace-service.image.gateway.tag" -}}
{{- coalesce $.Values.image.gateway.tag "latest" -}}
{{- end -}}

{{/*
Deployment - useKubeEnvironment
*/}}
{{- define "marketplace-service.useKubeEnvironment" -}}
{{- coalesce $.Values.useKubeEnvironment $.Values.global.useKubeEnvironment 1 -}}
{{- end -}}