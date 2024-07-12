{{/*
Deployment - Pushpin Repository
*/}}
{{- define "websocket.image.pushpin.repository" -}}
{{- coalesce $.Values.image.pushpin.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Reverse Proxy Repository
*/}}
{{- define "websocket.image.reverseProxy.repository" -}}
{{- coalesce $.Values.image.reverseProxy.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}

{{/*
Deployment - Subscriber Repository
*/}}
{{- define "websocket.image.subscriber.repository" -}}
{{- coalesce $.Values.image.subscriber.repository $.Values.global.ikigai_repository "registry.ikigailabs.io/ikigai" -}}
{{- end -}}