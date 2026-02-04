# Borramos el certificado y todo lo que cert-manager generó automáticamente
kubectl delete certificate portfolio-tls-prod -n proyectoportfolio
kubectl delete certificaterequest --all -n proyectoportfolio
kubectl delete order --all -n proyectoportfolio
kubectl delete challenge --all -n proyectoportfolio

# Borramos el secreto por si acaso quedó algo corrupto
kubectl delete secret portfolio-tls-prod -n proyectoportfolio
