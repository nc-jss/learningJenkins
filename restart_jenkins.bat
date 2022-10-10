start chrome http://localhost:8080/login?from=%2F

call docker container ls
::call docker restart kind-control-plane
call docker ps --all
call kubectl get pods
echo off
set message= echo enter following user and password ^& echo   admin ^& echo get pass:  ^& echo   kubectl exec -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password  ^& echo forward:  ^& echo   kubectl port-forward svc/jenkins 8080:8080 
%message%

::call kubectl exec -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password
::call GitBash kubectl get secret jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 -d

::call kubectl port-forward svc/jenkins 8080:8080



