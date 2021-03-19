#!/bin/sh
# shellcheck disable=SC2039
if [[ ! -f "/etc/rsyncd.secrets" ]]; then
        echo "password file '/etc/rsyncd.secrets' not existed. exit none zero."
        exit 1
fi
# shellcheck disable=SC2039
if [[ -z "${SYNC_HOST}" ]]; then
        echo "SYNC_HOST is not defined. exit none zero."
        exit 1
fi

# shellcheck disable=SC2039
if [[ -z "${TARGET_DIR}" ]]; then
        echo "TARGET_DIR is not defined. exit none zero."
        exit 1
fi
mkdir -p "${TARGET_DIR}"

# shellcheck disable=SC2039
if [[ -z "${RSYNC_INTERNAL}" ]]; then
        echo "RSYNC_INTERNAL is not defined. exit none zero."
        exit 1
fi

while true; do
   echo "Starting to sync repos @ $(date)"
   # shellcheck disable=SC2039
   if [[ -z "${ADDITIONAL_PARAMETERS}" ]]; then
      rsync -av --partial --progress --password-file=/etc/rsyncd.secrets  "${SYNC_HOST}"  "${TARGET_DIR}"
   else
      rsync -av --partial --progress ${ADDITIONAL_PARAMETERS} --password-file=/etc/rsyncd.secrets  "${SYNC_HOST}"  "${TARGET_DIR}"
   fi
   sleep "${RSYNC_INTERNAL}"
done
