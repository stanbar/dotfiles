function unlock-all-gcloud-instances --description 'unset delete protection flag from all gcloud instances'
	for line in (gcloud compute instances list)[2..-1]
set arr (string split " " $line)
echo setting for $arr[1]
gcloud compute instances update $arr[1] --no-deletion-protection
end
end
