{{/*
Deployment - Superset Repository
*/}}
{{- define "superset.image.superset.repository" -}}
{{- coalesce $.Values.image.superset.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Nginx Repository
*/}}
{{- define "superset.image.nginx.repository" -}}
{{- coalesce $.Values.image.nginx.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Redis Repository
*/}}
{{- define "superset.image.redis.repository" -}}
{{- coalesce $.Values.image.redis.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}