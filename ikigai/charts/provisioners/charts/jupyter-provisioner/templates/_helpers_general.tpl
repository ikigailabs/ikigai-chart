{{/*
Deployment - Repository
*/}}
{{- define "jupyter-provisioner.image.service.repository" -}}
{{- coalesce $.Values.image.service.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Tag
*/}}
{{- define "jupyter-provisioner.image.service.tag" -}}
{{- coalesce $.Values.image.service.tag "latest" -}}
{{- end -}}

{{/*
Deployment - useKubeEnvironment
*/}}
{{- define "jupyter-provisioner.useKubeEnvironment" -}}
{{- coalesce $.Values.useKubeEnvironment $.Values.global.useKubeEnvironment 1 -}}
{{- end -}}
