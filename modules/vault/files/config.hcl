listener "tcp" {
    address     = "0.0.0.0:8200"
    tls_disable = true # don't do this in production - always use TLS in prod
}

storage "file" {
    path = "./hvault"
}

disable_mlock = true # don't do this in production either
# ^ setting this to true allows leaking of sensitive data to disk/swap
# we're doing it here to avoid running the process as root
# or modifying any system tunables
