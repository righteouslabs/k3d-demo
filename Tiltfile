print('Hello Tilt!')

# Reference: https://docs.tilt.dev/api.html#api.update_settings
update_settings ( max_parallel_updates = 3 , k8s_upsert_timeout_secs = 300 , suppress_unused_image_warnings = None )

docker_build('sample-app', 'sample/', dockerfile='sample/Dockerfile')

k8s_yaml(
  helm(
    'sample/conf/charts/sample-app',
    set=['app.srcFrom=null']
  )
)
