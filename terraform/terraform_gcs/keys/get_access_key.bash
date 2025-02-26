export TF_VAR_google_access_token=$(gcloud auth application-default print-access-token)
echo $TF_VAR_google_access_token
echo "after bucket used run - terraform destroy"