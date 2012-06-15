#!/bin/sh
export CODESIGN_ALLOCATE=/Library/JailCoder/codesign_allocate
if [ "${PLATFORM_NAME}" == "iphoneos" ]; then
/Library/JailCoder/Entitlements/Entitlements.py "my.company.${PROJECT_NAME}" "${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/${PROJECT_NAME}.xcent";
codesign -f -s "iPhone Developer" --entitlements "${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/${PROJECT_NAME}.xcent" "${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/"
fi
