function isValid(value as dynamic) as boolean
    return Type(value) <> "<uninitialized>" AND value <> invalid
end function

function isNonEmptyArray(value as dynamic) as boolean
    return isValid(value) AND GetInterface(value, "ifArray") <> invalid AND value.Count() > 0
end function

function getScreenDisplaySize() as object
    deviceInfo = CreateObject("roDeviceInfo")
    uiDisplaySize = deviceInfo.GetDisplaySize()
    return uiDisplaySize
end function

function fetchFromApi(url as String) as Object
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL(url)
    response = xfer.GetToString()
    
    json = ParseJson(response)
    if json <> invalid then
        return json
    else
        return invalid
    end if
end function