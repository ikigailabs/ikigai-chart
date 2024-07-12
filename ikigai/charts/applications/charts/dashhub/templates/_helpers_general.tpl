{{/*
Deployment - Hub Repository
*/}}
{{- define "dashhub.image.hub.repository" -}}
{{- coalesce $.Values.image.hub.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Proxy Repository
*/}}
{{- define "dashhub.image.proxy.repository" -}}
{{- coalesce $.Values.image.proxy.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Node Repository
*/}}
{{- define "dashhub.image.node.repository" -}}
{{- coalesce $.Values.image.node.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Culler Repository
*/}}
{{- define "dashhub.image.culler.repository" -}}
{{- coalesce $.Values.image.culler.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}