{
    "allow_user_certificates": true,
    "allowed_users": "centos",
    "default_user": "ec2-user",
    "allow_user_key_ids": "true",
    "default_extensions": [
        {
          "permit-pty": ""
        }
    ],
    "key_type": "ca",
    "ttl": "60m0s",
    "allow_user_key_ids": "false",
    "key_id_format": "{{token_display_name}}"
}